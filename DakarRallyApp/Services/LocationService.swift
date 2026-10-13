import Foundation
import CoreLocation
import SwiftUI
import Combine
public final class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published public var telemetry = TelemetryState()
    @Published public var activeStage: DakarStage?
    private let locationManager = CLLocationManager()
    private var lastLocation: CLLocation?
    private var simulationTimer: Timer?
    private var simulationRouteCoordinates: [CLLocationCoordinate2D] = []
    private var simulationCoordinateIndex: Int = 0
    private var simulationStepFraction: Double = 0.0
    public override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 2.0
        locationManager.headingFilter = 1.0
    }
    public func requestPermissions() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    public func startLiveTracking() {
        stopSimulation()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        telemetry.isSimulating = false
    }
    public func stopLiveTracking() {
        locationManager.stopUpdatingLocation()
        locationManager.stopUpdatingHeading()
    }
    public func setStage(_ stage: DakarStage) {
        self.activeStage = stage
        telemetry.totalOdoKM = 0.0
        telemetry.partialOdoKM = 0.0
        telemetry.odoOffsetKM = 0.0
        telemetry.currentNoteIndex = 0
        telemetry.validatedWaypointsCount = 0
        telemetry.stageStartTime = Date()
        telemetry.elapsedTimeSeconds = 0.0
        telemetry.maxSpeedKmh = 0.0
        telemetry.averageSpeedKmh = 0.0
        telemetry.penaltySeconds = 0
        if let first = stage.notes.first {
            telemetry.currentLatitude = first.latitude
            telemetry.currentLongitude = first.longitude
            telemetry.currentAltitudeMeters = first.altitudeMeters
            telemetry.currentHeadingDegrees = Double(first.tulip.headingCAP)
            telemetry.targetWaypointNumber = first.id
            telemetry.targetWaypointCode = first.waypointCode.isEmpty ? "WPT \(first.id)" : first.waypointCode
        }
        updateTargetWaypointGuidance()
    }
    public func toggleSpeedUnit() {
        telemetry.speedUnit = telemetry.speedUnit == .kmh ? .mph : .kmh
    }
    public func adjustTotalOdo(by deltaKM: Double) {
        telemetry.odoOffsetKM += deltaKM
        telemetry.totalOdoKM = max(0.0, telemetry.totalOdoKM + deltaKM)
    }
    public func resetPartialOdo() {
        telemetry.partialOdoKM = 0.0
    }
    public func nextNote() {
        guard let stage = activeStage else { return }
        if telemetry.currentNoteIndex < stage.notes.count - 1 {
            telemetry.currentNoteIndex += 1
            updateTargetWaypointGuidance()
        }
    }
    public func previousNote() {
        if telemetry.currentNoteIndex > 0 {
            telemetry.currentNoteIndex -= 1
            updateTargetWaypointGuidance()
        }
    }
    public func toggleBiffage(for index: Int) {
        guard var stage = activeStage, stage.notes.indices.contains(index) else { return }
        stage.notes[index].isBiffed.toggle()
        self.activeStage = stage
    }
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !telemetry.isSimulating, let location = locations.last else { return }
        processNewLocation(location)
    }
    public func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        guard !telemetry.isSimulating else { return }
        if newHeading.headingAccuracy >= 0 {
            telemetry.currentHeadingDegrees = newHeading.trueHeading >= 0 ? newHeading.trueHeading : newHeading.magneticHeading
            updateTargetWaypointGuidance()
        }
    }
    private func processNewLocation(_ location: CLLocation) {
        telemetry.currentLatitude = location.coordinate.latitude
        telemetry.currentLongitude = location.coordinate.longitude
        telemetry.currentAltitudeMeters = location.altitude
        telemetry.currentSpeedKmh = max(0.0, location.speed * 3.6)
        if location.course >= 0 {
            telemetry.currentHeadingDegrees = location.course
        }
        if let previous = lastLocation {
            let distanceMeters = location.distance(from: previous)
            let distanceKM = distanceMeters / 1000.0
            telemetry.totalOdoKM += distanceKM
            telemetry.partialOdoKM += distanceKM
            let altitudeDelta = location.altitude - previous.altitude
            if distanceMeters > 1.0 {
                let pitchRad = atan2(altitudeDelta, distanceMeters)
                telemetry.currentPitchDegrees = pitchRad * (180.0 / .pi)
            }
        }
        lastLocation = location
        if let start = telemetry.stageStartTime {
            telemetry.elapsedTimeSeconds = Date().timeIntervalSince(start)
            telemetry.maxSpeedKmh = max(telemetry.maxSpeedKmh, telemetry.currentSpeedKmh)
            if telemetry.elapsedTimeSeconds > 2 {
                let hours = telemetry.elapsedTimeSeconds / 3600.0
                telemetry.averageSpeedKmh = telemetry.totalOdoKM / hours
                if let stage = activeStage, telemetry.averageSpeedKmh > 5 {
                    let remainingKM = max(0.0, stage.totalDistanceKM - telemetry.totalOdoKM)
                    telemetry.estimatedTimeRemainingSeconds = (remainingKM / telemetry.averageSpeedKmh) * 3600.0
                }
            }
            if telemetry.isInsideSpeedZone && telemetry.isSpeedExceeded {
                telemetry.penaltySeconds += 1
            }
        }
        checkWaypointProgress(currentCoord: location.coordinate)
    }
    private func checkWaypointProgress(currentCoord: CLLocationCoordinate2D) {
        guard var stage = activeStage, stage.notes.indices.contains(telemetry.currentNoteIndex) else { return }
        let targetNote = stage.notes[telemetry.currentNoteIndex]
        let targetLoc = CLLocation(latitude: targetNote.latitude, longitude: targetNote.longitude)
        let currentLoc = CLLocation(latitude: currentCoord.latitude, longitude: currentCoord.longitude)
        let dtwMeters = currentLoc.distance(from: targetLoc)
        telemetry.distanceToWaypointKM = dtwMeters / 1000.0
        let validationRadius: Double = (targetNote.waypointType == .dz || targetNote.waypointType == .fz) ? 60.0 : 45.0
        if dtwMeters <= validationRadius && !targetNote.isValidated {
            stage.notes[telemetry.currentNoteIndex].isValidated = true
            stage.notes[telemetry.currentNoteIndex].isBiffed = true
            telemetry.validatedWaypointsCount += 1
            SoundEffectManager.shared.playWaypointValidated()
            if telemetry.currentNoteIndex < stage.notes.count - 1 {
                telemetry.currentNoteIndex += 1
                telemetry.partialOdoKM = 0.0
            }
            self.activeStage = stage
        }
        updateTargetWaypointGuidance()
    }
    private func updateTargetWaypointGuidance() {
        guard let stage = activeStage, stage.notes.indices.contains(telemetry.currentNoteIndex) else { return }
        let currentNote = stage.notes[telemetry.currentNoteIndex]
        telemetry.targetWaypointNumber = currentNote.id
        telemetry.targetWaypointCode = currentNote.waypointCode.isEmpty ? "WPT \(currentNote.id)" : currentNote.waypointCode
        let ctw = calculateBearing(
            from: CLLocationCoordinate2D(latitude: telemetry.currentLatitude, longitude: telemetry.currentLongitude),
            to: CLLocationCoordinate2D(latitude: currentNote.latitude, longitude: currentNote.longitude)
        )
        telemetry.capToWaypointDegrees = ctw
        var diff = ctw - telemetry.currentHeadingDegrees
        while diff > 180 { diff -= 360 }
        while diff < -180 { diff += 360 }
        telemetry.relativeBearingDegrees = diff
        if let limit = currentNote.speedLimit {
            telemetry.isInsideSpeedZone = true
            telemetry.activeSpeedLimit = limit
            let exceeded = telemetry.currentSpeedKmh > Double(limit)
            if exceeded && !telemetry.isSpeedExceeded {
                SoundEffectManager.shared.playSpeedExceededAlert()
            }
            telemetry.isSpeedExceeded = exceeded
        } else {
            telemetry.isInsideSpeedZone = false
            telemetry.activeSpeedLimit = nil
            telemetry.isSpeedExceeded = false
        }
    }
    private func calculateBearing(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> Double {
        let lat1 = from.latitude * .pi / 180.0
        let lon1 = from.longitude * .pi / 180.0
        let lat2 = to.latitude * .pi / 180.0
        let lon2 = to.longitude * .pi / 180.0
        let dLon = lon2 - lon1
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radians = atan2(y, x)
        let degrees = (radians * 180.0 / .pi + 360.0).truncatingRemainder(dividingBy: 360.0)
        return degrees
    }
    public func startSimulation(coordinates: [CLLocationCoordinate2D], speedMultiplier: Double = 2.0) {
        guard coordinates.count >= 2 else { return }
        stopLiveTracking()
        self.simulationRouteCoordinates = coordinates
        self.simulationCoordinateIndex = 0
        self.simulationStepFraction = 0.0
        telemetry.isSimulating = true
        telemetry.simulationSpeedMultiplier = speedMultiplier
        let start = coordinates[0]
        telemetry.currentLatitude = start.latitude
        telemetry.currentLongitude = start.longitude
        telemetry.currentSpeedKmh = 85.0 * speedMultiplier
        telemetry.currentAltitudeMeters = 380.0
        simulationTimer?.invalidate()
        simulationTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [weak self] _ in
            self?.advanceSimulationStep()
        }
    }
    public func stopSimulation() {
        simulationTimer?.invalidate()
        simulationTimer = nil
        telemetry.isSimulating = false
    }
    private func advanceSimulationStep() {
        guard simulationRouteCoordinates.count > 1 else { return }
        let nextIndex = simulationCoordinateIndex + 1
        guard nextIndex < simulationRouteCoordinates.count else {
            stopSimulation()
            return
        }
        let p1 = simulationRouteCoordinates[simulationCoordinateIndex]
        let p2 = simulationRouteCoordinates[nextIndex]
        let segmentDistance = CLLocation(latitude: p1.latitude, longitude: p1.longitude)
            .distance(from: CLLocation(latitude: p2.latitude, longitude: p2.longitude))
        let stepMeters = (85.0 * telemetry.simulationSpeedMultiplier / 3.6) * 0.2
        let fractionDelta = segmentDistance > 0 ? (stepMeters / segmentDistance) : 1.0
        simulationStepFraction += fractionDelta
        if simulationStepFraction >= 1.0 {
            simulationStepFraction = 0.0
            simulationCoordinateIndex += 1
            if simulationCoordinateIndex >= simulationRouteCoordinates.count - 1 {
                stopSimulation()
                return
            }
        }
        let curLat = p1.latitude + (p2.latitude - p1.latitude) * simulationStepFraction
        let curLon = p1.longitude + (p2.longitude - p1.longitude) * simulationStepFraction
        let currentCoord = CLLocationCoordinate2D(latitude: curLat, longitude: curLon)
        telemetry.currentLatitude = curLat
        telemetry.currentLongitude = curLon
        telemetry.currentHeadingDegrees = calculateBearing(from: p1, to: p2)
        telemetry.currentSpeedKmh = Double.random(in: 72...95) * telemetry.simulationSpeedMultiplier
        telemetry.currentAltitudeMeters = 380.0 + sin(Double(simulationCoordinateIndex)) * 24.0
        telemetry.currentPitchDegrees = Double.random(in: -3.5...4.2)
        let distDeltaKM = (stepMeters / 1000.0)
        telemetry.totalOdoKM += distDeltaKM
        telemetry.partialOdoKM += distDeltaKM
        telemetry.elapsedTimeSeconds += 0.2
        telemetry.maxSpeedKmh = max(telemetry.maxSpeedKmh, telemetry.currentSpeedKmh)
        if telemetry.elapsedTimeSeconds > 2 {
            let hours = telemetry.elapsedTimeSeconds / 3600.0
            telemetry.averageSpeedKmh = telemetry.totalOdoKM / hours
            if let stage = activeStage, telemetry.averageSpeedKmh > 5 {
                let remainingKM = max(0.0, stage.totalDistanceKM - telemetry.totalOdoKM)
                telemetry.estimatedTimeRemainingSeconds = (remainingKM / telemetry.averageSpeedKmh) * 3600.0
            }
        }
        if telemetry.isInsideSpeedZone && telemetry.isSpeedExceeded {
            telemetry.penaltySeconds += 1
        }
        checkWaypointProgress(currentCoord: currentCoord)
    }
}
