import Foundation
import MapKit
import CoreLocation
public final class AppleMapKitRouteEngine {
    public static let shared = AppleMapKitRouteEngine()
    private init() {}
    public func searchLocation(query: String) async throws -> [MKMapItem] {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        let search = MKLocalSearch(request: request)
        let response = try await search.start()
        return response.mapItems
    }
    public func calculateAlternativeRoutes(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) async throws -> [RallyRouteOption] {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        let directions = MKDirections(request: request)
        let response = try await directions.calculate()
        guard !response.routes.isEmpty else {
            throw NSError(domain: "DakarRouteEngine", code: 404, userInfo: [NSLocalizedDescriptionKey: "No routes found between points"])
        }
        var options: [RallyRouteOption] = []
        for (index, route) in response.routes.enumerated() {
            var coords = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid, count: route.polyline.pointCount)
            route.polyline.getCoordinates(&coords, range: NSRange(location: 0, length: route.polyline.pointCount))
            let distKM = (route.distance / 1000.0 * 100).rounded() / 100
            let durationMin = (route.expectedTravelTime / 60.0).rounded()
            let title = index == 0 ? "Route 1 (Shortest Raid Track)" : (index == 1 ? "Route 2 (Alternate Dune Track)" : "Route \(index + 1) (Main Road Track)")
            options.append(RallyRouteOption(
                id: index + 1,
                name: "\(title) • \(distKM) km • \(Int(durationMin)) min",
                distanceKM: distKM,
                expectedDurationMinutes: durationMin,
                polylineCoordinates: coords
            ))
        }
        return options
    }
    public func generateRoadbook(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, stageTitle: String = "DAKAR SPECIAL STAGE", routeIndex: Int = 0) async throws -> (stage: DakarStage, polylineCoordinates: [CLLocationCoordinate2D]) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        let directions = MKDirections(request: request)
        let response = try await directions.calculate()
        guard !response.routes.isEmpty else {
            throw NSError(domain: "DakarRouteEngine", code: 404, userInfo: [NSLocalizedDescriptionKey: "No route found between points"])
        }
        let selectedRoute = (routeIndex < response.routes.count) ? response.routes[routeIndex] : response.routes[0]
        var coordinates = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid, count: selectedRoute.polyline.pointCount)
        selectedRoute.polyline.getCoordinates(&coordinates, range: NSRange(location: 0, length: selectedRoute.polyline.pointCount))
        var notes: [RoadbookNote] = []
        var runningDistanceKM: Double = 0.0
        var noteCounter = 1
        let startCoord = coordinates.first ?? source
        let startTulip = TulipDiagram(
            incomingBearing: 0,
            outgoingBearing: calculateBearing(from: startCoord, to: coordinates.count > 1 ? coordinates[1] : destination),
            headingCAP: Int(calculateBearing(from: startCoord, to: coordinates.count > 1 ? coordinates[1] : destination)),
            turnType: .straight,
            isOffTrack: false,
            extraLabels: ["DEPART", "DSS"]
        )
        notes.append(RoadbookNote(
            id: noteCounter,
            totalKM: 0.0,
            partialKM: 0.0,
            tulip: startTulip,
            waypointType: .start,
            waypointCode: "DSS 01",
            danger: .none,
            speedLimit: 100,
            lexiconCodes: ["START", "DZ", "PP"],
            textComment: "DEPART SS - FOLLOW TRACES",
            latitude: startCoord.latitude,
            longitude: startCoord.longitude,
            altitudeMeters: 420.0
        ))
        noteCounter += 1
        for (index, step) in selectedRoute.steps.enumerated() {
            guard step.distance > 20 else { continue }
            let stepKM = step.distance / 1000.0
            runningDistanceKM += stepKM
            let stepCoord = step.polyline.coordinate
            let nextCoord = (index + 1 < selectedRoute.steps.count) ? selectedRoute.steps[index + 1].polyline.coordinate : destination
            let capHeading = Int(calculateBearing(from: stepCoord, to: nextCoord))
            let turnType = classifyTurn(instructions: step.instructions, notice: step.notice)
            let danger = classifyDanger(instructions: step.instructions, distance: step.distance)
            let isOffTrack = step.instructions.localizedCaseInsensitiveContains("unpaved") || step.instructions.localizedCaseInsensitiveContains("track")
            var lexiconList: [String] = []
            if isOffTrack {
                lexiconList.append("HP")
                lexiconList.append("SA")
            } else {
                lexiconList.append("PP")
            }
            if danger != .none {
                lexiconList.append(danger.symbolString)
            }
            var wpType: WaypointType = .wpm
            var wpCode = "WPT \(noteCounter)"
            var speedLim: Int? = nil
            if step.instructions.localizedCaseInsensitiveContains("village") || step.instructions.localizedCaseInsensitiveContains("town") {
                wpType = .dz
                wpCode = "DZ 100"
                speedLim = 100
                lexiconList.append("DZ")
                lexiconList.append("VIL")
            } else if noteCounter % 4 == 0 {
                wpType = .wpc
                wpCode = "CP \(noteCounter / 4)"
                lexiconList.append("WPC")
            } else if noteCounter % 3 == 0 {
                wpType = .wps
                wpCode = "WPS \(noteCounter)"
                lexiconList.append("WPS")
            }
            let prevCoord = index > 0 ? selectedRoute.steps[index - 1].polyline.coordinate : startCoord
            let tulip = TulipDiagram(
                incomingBearing: calculateBearing(from: prevCoord, to: stepCoord),
                outgoingBearing: Double(capHeading),
                headingCAP: capHeading,
                turnType: turnType,
                isOffTrack: isOffTrack,
                extraLabels: [turnType == .straight ? "TDSPP" : "RP", "\(Int(step.distance))m"]
            )
            let cleanComment = step.instructions.isEmpty ? "FOLLOW MAIN TRACK" : step.instructions.uppercased()
            notes.append(RoadbookNote(
                id: noteCounter,
                totalKM: (runningDistanceKM * 100).rounded() / 100,
                partialKM: (stepKM * 100).rounded() / 100,
                tulip: tulip,
                waypointType: wpType,
                waypointCode: wpCode,
                danger: danger,
                speedLimit: speedLim,
                lexiconCodes: lexiconList,
                textComment: cleanComment,
                latitude: stepCoord.latitude,
                longitude: stepCoord.longitude,
                altitudeMeters: 420.0 + Double(noteCounter * 8)
            ))
            noteCounter += 1
        }
        let finishCoord = coordinates.last ?? destination
        let finishNote = RoadbookNote(
            id: noteCounter,
            totalKM: (selectedRoute.distance / 1000.0 * 100).rounded() / 100,
            partialKM: ((selectedRoute.distance / 1000.0 - runningDistanceKM) * 100).rounded() / 100,
            tulip: TulipDiagram(
                incomingBearing: calculateBearing(from: coordinates.count > 2 ? coordinates[coordinates.count - 2] : startCoord, to: finishCoord),
                outgoingBearing: 0,
                headingCAP: 0,
                turnType: .straight,
                isOffTrack: false,
                extraLabels: ["ASS", "FINISH"]
            ),
            waypointType: .finish,
            waypointCode: "ASS (FINISH)",
            danger: .none,
            speedLimit: 30,
            lexiconCodes: ["FINISH", "FZ"],
            textComment: "ARRIVEE SPECIALE (ASS) - STOP CHRONO",
            latitude: finishCoord.latitude,
            longitude: finishCoord.longitude,
            altitudeMeters: 450.0
        )
        notes.append(finishNote)
        let dakarStage = DakarStage(
            title: stageTitle,
            stageCode: "SS RAIDE",
            totalDistanceKM: (selectedRoute.distance / 1000.0 * 100).rounded() / 100,
            waypointCount: notes.count,
            controlPointCount: notes.filter { $0.waypointType == .cp || $0.waypointType == .wpc }.count,
            notes: notes
        )
        return (stage: dakarStage, polylineCoordinates: coordinates)
    }
    private func classifyTurn(instructions: String, notice: String?) -> TurnType {
        let text = instructions.lowercased()
        if text.contains("hairpin left") || text.contains("sharp left") {
            return .hairpinLeft
        } else if text.contains("hairpin right") || text.contains("sharp right") {
            return .hairpinRight
        } else if text.contains("slight left") || text.contains("keep left") {
            return .slightLeft
        } else if text.contains("slight right") || text.contains("keep right") {
            return .slightRight
        } else if text.contains("left") {
            return .left
        } else if text.contains("right") {
            return .right
        } else if text.contains("fork") {
            return text.contains("right") ? .forkRight : .forkLeft
        }
        return .straight
    }
    private func classifyDanger(instructions: String, distance: CLLocationDistance) -> DangerLevel {
        let text = instructions.lowercased()
        if text.contains("hairpin") || text.contains("sharp") || text.contains("roundabout") {
            return .danger2
        } else if text.contains("caution") || text.contains("hazard") || text.contains("unpaved") || text.contains("merge") {
            return .danger1
        }
        return .none
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
}
