import Foundation
import CoreLocation

public enum WaypointType: String, Codable, CaseIterable {
    case start = "START"
    case finish = "FINISH"
    case wpc = "WPC"   // Waypoint Control
    case wps = "WPS"   // Waypoint Safety
    case wpm = "WPM"   // Waypoint Masked
    case wpe = "WPE"   // Waypoint Eclipse
    case dz = "DZ"     // Start Speed Zone
    case fz = "FZ"     // Finish Speed Zone
    case cp = "CP"     // Checkpoint
    
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
    case danger1 = 1  // !
    case danger2 = 2  // !!
    case danger3 = 3  // !!!
    
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
    public var incomingBearing: Double   // 0-360, where the vehicle arrived from
    public var outgoingBearing: Double   // 0-360, where the arrow points
    public var headingCAP: Int           // 0-359 compass CAP displayed in yellow badge
    public var turnType: TurnType
    public var isOffTrack: Bool          // dashed line for HP (hors-piste)
    public var extraLabels: [String]     // e.g. ["PLATEAU", "SA"]
    
    public init(
        incomingBearing: Double = 0,
        outgoingBearing: Double = 0,
        headingCAP: Int = 0,
        turnType: TurnType = .straight,
        isOffTrack: Bool = false,
        extraLabels: [String] = []
    ) {
        self.incomingBearing = incomingBearing
        self.outgoingBearing = outgoingBearing
        self.headingCAP = headingCAP
        self.turnType = turnType
        self.isOffTrack = isOffTrack
        self.extraLabels = extraLabels
    }
}

public struct RoadbookNote: Identifiable, Codable, Equatable {
    public var id: Int                   // Sequence note number (1, 2, 3... 12)
    public var totalKM: Double           // ODO Total e.g. 29.82
    public var partialKM: Double         // ODO Partiel e.g. 2.25
    public var tulip: TulipDiagram
    public var waypointType: WaypointType?
    public var waypointCode: String      // e.g. "B1", "CP2", "WPT 12"
    public var danger: DangerLevel
    public var speedLimit: Int?          // e.g. 30, 50 km/h in DZ zone
    public var lexiconCodes: [String]    // e.g. ["HP", "SA", "DN L1", "ET"]
    public var textComment: String       // e.g. "FOLLOW TRACES", "PLATEAU SA"
    public var latitude: Double
    public var longitude: Double
    public var altitudeMeters: Double
    public var isBiffed: Bool            // Crossed out after passing (biffage)
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
    public var stageCode: String         // e.g. "SS 01", "STAGE 5"
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

public struct TelemetryState: Equatable {
    public var currentSpeedKmh: Double = 0.0
    public var currentHeadingDegrees: Double = 0.0
    public var currentLatitude: Double = 0.0
    public var currentLongitude: Double = 0.0
    public var currentAltitudeMeters: Double = 0.0
    public var currentPitchDegrees: Double = 0.0
    
    // Odometer state (ERTF Unik4)
    public var totalOdoKM: Double = 0.0
    public var partialOdoKM: Double = 0.0
    public var odoOffsetKM: Double = 0.0
    
    // Waypoint Guidance
    public var currentNoteIndex: Int = 0
    public var targetWaypointCode: String = "--"
    public var targetWaypointNumber: Int = 1
    public var distanceToWaypointKM: Double = 0.0  // DTW
    public var capToWaypointDegrees: Double = 0.0 // CTW
    public var relativeBearingDegrees: Double = 0.0 // Arrow deviation
    
    // Safety & DZ-FZ
    public var validatedWaypointsCount: Int = 0
    public var isInsideSpeedZone: Bool = false
    public var activeSpeedLimit: Int? = nil
    public var isSpeedExceeded: Bool = false
    public var isGpsLocked: Bool = true
    public var isSimulating: Bool = false
    public var simulationSpeedMultiplier: Double = 1.0
    
    public init() {}
}
