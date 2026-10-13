import Foundation
import CoreLocation
public enum WaypointType: String, Codable, CaseIterable {
    case start = "START"
    case finish = "FINISH"
    case wpc = "WPC"
    case wps = "WPS"
    case wpm = "WPM"
    case wpe = "WPE"
    case dz = "DZ"
    case fz = "FZ"
    case cp = "CP"
    public var title: String {
        switch self {
        case .start: return "START"
        case .finish: return "FINISH"
        case .wpc: return "WPC"
        case .wps: return "WPS"
        case .wpm: return "WPM"
        case .wpe: return "WPE"
        case .dz: return "DZ"
        case .fz: return "FZ"
        case .cp: return "CP"
        }
    }
}
public enum DangerLevel: Int, Codable {
    case none = 0
    case danger1 = 1
    case danger2 = 2
    case danger3 = 3
    public var symbolString: String {
        switch self {
        case .none: return ""
        case .danger1: return "!"
        case .danger2: return "!!"
        case .danger3: return "!!!"
        }
    }
}
public enum TurnType: String, Codable {
    case straight
    case slightRight
    case right
    case sharpRight
    case hairpinRight
    case slightLeft
    case left
    case sharpLeft
    case hairpinLeft
    case forkRight
    case forkLeft
    case offTrackStraight
    case offTrackRight
    case offTrackLeft
}
public struct TulipDiagram: Codable, Equatable {
    public var incomingBearing: Double
    public var outgoingBearing: Double
    public var headingCAP: Int
    public var turnType: TurnType
    public var isOffTrack: Bool
    public var extraLabels: [String]
    public var hasDuneRidge: Bool
    public var duneCount: Int
    public var secondaryBranchText: String?
    public init(
        incomingBearing: Double = 0,
        outgoingBearing: Double = 0,
        headingCAP: Int = 0,
        turnType: TurnType = .straight,
        isOffTrack: Bool = false,
        extraLabels: [String] = [],
        hasDuneRidge: Bool = false,
        duneCount: Int = 0,
        secondaryBranchText: String? = nil
    ) {
        self.incomingBearing = incomingBearing
        self.outgoingBearing = outgoingBearing
        self.headingCAP = headingCAP
        self.turnType = turnType
        self.isOffTrack = isOffTrack
        self.extraLabels = extraLabels
        self.hasDuneRidge = hasDuneRidge
        self.duneCount = duneCount
        self.secondaryBranchText = secondaryBranchText
    }
}
public struct RallyRouteOption: Identifiable, Equatable {
    public var id: Int
    public var name: String
    public var distanceKM: Double
    public var expectedDurationMinutes: Double
    public var polylineCoordinates: [CLLocationCoordinate2D]
    public init(id: Int, name: String, distanceKM: Double, expectedDurationMinutes: Double, polylineCoordinates: [CLLocationCoordinate2D]) {
        self.id = id
        self.name = name
        self.distanceKM = distanceKM
        self.expectedDurationMinutes = expectedDurationMinutes
        self.polylineCoordinates = polylineCoordinates
    }
    public static func == (lhs: RallyRouteOption, rhs: RallyRouteOption) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.distanceKM == rhs.distanceKM &&
        lhs.expectedDurationMinutes == rhs.expectedDurationMinutes
    }
}
public struct RoadbookNote: Identifiable, Codable, Equatable {
    public var id: Int
    public var totalKM: Double
    public var partialKM: Double
    public var tulip: TulipDiagram
    public var waypointType: WaypointType?
    public var waypointCode: String
    public var danger: DangerLevel
    public var speedLimit: Int?
    public var lexiconCodes: [String]
    public var textComment: String
    public var latitude: Double
    public var longitude: Double
    public var altitudeMeters: Double
    public var isBiffed: Bool
    public var isValidated: Bool
    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    public init(
        id: Int,
        totalKM: Double,
        partialKM: Double,
        tulip: TulipDiagram,
        waypointType: WaypointType? = nil,
        waypointCode: String = "",
        danger: DangerLevel = .none,
        speedLimit: Int? = nil,
        lexiconCodes: [String] = [],
        textComment: String = "",
        latitude: Double = 0,
        longitude: Double = 0,
        altitudeMeters: Double = 0,
        isBiffed: Bool = false,
        isValidated: Bool = false
    ) {
        self.id = id
        self.totalKM = totalKM
        self.partialKM = partialKM
        self.tulip = tulip
        self.waypointType = waypointType
        self.waypointCode = waypointCode
        self.danger = danger
        self.speedLimit = speedLimit
        self.lexiconCodes = lexiconCodes
        self.textComment = textComment
        self.latitude = latitude
        self.longitude = longitude
        self.altitudeMeters = altitudeMeters
        self.isBiffed = isBiffed
        self.isValidated = isValidated
    }
}
public struct DakarStage: Identifiable, Codable, Equatable {
    public var id: String
    public var title: String
    public var stageCode: String
    public var totalDistanceKM: Double
    public var waypointCount: Int
    public var controlPointCount: Int
    public var notes: [RoadbookNote]
    public init(
        id: String = UUID().uuidString,
        title: String,
        stageCode: String,
        totalDistanceKM: Double,
        waypointCount: Int,
        controlPointCount: Int,
        notes: [RoadbookNote]
    ) {
        self.id = id
        self.title = title
        self.stageCode = stageCode
        self.totalDistanceKM = totalDistanceKM
        self.waypointCount = waypointCount
        self.controlPointCount = controlPointCount
        self.notes = notes
    }
}
public enum SpeedUnit: String, Codable, CaseIterable {
    case kmh = "km/h"
    case mph = "mph"
    public var label: String { rawValue }
    public func convert(fromKmh kmh: Double) -> Double {
        switch self {
        case .kmh: return kmh
        case .mph: return kmh * 0.621371
        }
    }
}
public struct TelemetryState: Equatable {
    public var currentSpeedKmh: Double = 0.0
    public var currentHeadingDegrees: Double = 0.0
    public var currentLatitude: Double = 0.0
    public var currentLongitude: Double = 0.0
    public var currentAltitudeMeters: Double = 0.0
    public var currentPitchDegrees: Double = 0.0
    public var totalOdoKM: Double = 0.0
    public var partialOdoKM: Double = 0.0
    public var odoOffsetKM: Double = 0.0
    public var currentNoteIndex: Int = 0
    public var targetWaypointCode: String = "--"
    public var targetWaypointNumber: Int = 1
    public var distanceToWaypointKM: Double = 0.0
    public var capToWaypointDegrees: Double = 0.0
    public var relativeBearingDegrees: Double = 0.0
    public var stageStartTime: Date? = nil
    public var elapsedTimeSeconds: TimeInterval = 0.0
    public var averageSpeedKmh: Double = 0.0
    public var maxSpeedKmh: Double = 0.0
    public var estimatedTimeRemainingSeconds: TimeInterval = 0.0
    public var speedUnit: SpeedUnit = .kmh
    public var penaltySeconds: Int = 0
    public var validatedWaypointsCount: Int = 0
    public var isInsideSpeedZone: Bool = false
    public var activeSpeedLimit: Int? = nil
    public var isSpeedExceeded: Bool = false
    public var isGpsLocked: Bool = true
    public var isSimulating: Bool = false
    public var simulationSpeedMultiplier: Double = 1.0
    public init() {}
    public var currentSpeedInUnit: Double {
        speedUnit.convert(fromKmh: currentSpeedKmh)
    }
    public var averageSpeedInUnit: Double {
        speedUnit.convert(fromKmh: averageSpeedKmh)
    }
    public var maxSpeedInUnit: Double {
        speedUnit.convert(fromKmh: maxSpeedKmh)
    }
    public var formattedElapsedTime: String {
        let hours = Int(elapsedTimeSeconds) / 3600
        let minutes = (Int(elapsedTimeSeconds) % 3600) / 60
        let seconds = Int(elapsedTimeSeconds) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    public var formattedETA: String {
        guard estimatedTimeRemainingSeconds > 0 && estimatedTimeRemainingSeconds < 86400 else { return "--:--:--" }
        let hours = Int(estimatedTimeRemainingSeconds) / 3600
        let minutes = (Int(estimatedTimeRemainingSeconds) % 3600) / 60
        let seconds = Int(estimatedTimeRemainingSeconds) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
