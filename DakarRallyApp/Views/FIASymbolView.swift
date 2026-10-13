import SwiftUI

public struct FIASymbolView: View {
    public let danger: DangerLevel
    public let speedLimit: Int?
    public let waypointType: WaypointType?
    public let lexiconCodes: [String]
    public let textComment: String
    
    public init(
        danger: DangerLevel = .none,
        speedLimit: Int? = nil,
        waypointType: WaypointType? = nil,
        lexiconCodes: [String] = [],
        textComment: String = ""
    ) {
        self.danger = danger
        self.speedLimit = speedLimit
        self.waypointType = waypointType
        self.lexiconCodes = lexiconCodes
        self.textComment = textComment
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Top row: Waypoint type icon & Danger symbols
            HStack(spacing: 6) {
                // Waypoint Stamp
                if let wp = waypointType {
                    waypointBadge(for: wp)
                }
                
                // Speed Limit Badge (DZ / FZ)
                if let limit = speedLimit {
                    ZStack {
                        Circle()
                            .stroke(Color.red, lineWidth: 3)
                            .background(Circle().fill(Color.white))
                            .frame(width: 28, height: 28)
                        Text("\(limit)")
                            .font(.system(size: 11, weight: .black))
                            .foregroundColor(.black)
                    }
                }
                
                // Dangers ! / !! / !!!
                if danger != .none {
                    HStack(spacing: 1) {
                        ForEach(0..<danger.rawValue, id: \.self) { _ in
                            Text("!")
                                .font(.system(size: 20, weight: .black, design: .serif))
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.horizontal, 2)
                }
                
                Spacer()
            }
            
            // Middle row: FIA Lexicon Acronyms
            if !lexiconCodes.isEmpty {
                HStack(spacing: 4) {
                    ForEach(filteredCodes, id: \.self) { code in
                        Text(code)
                            .font(.system(size: 12, weight: .black, design: .monospaced))
                            .foregroundColor(.black)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 1)
                            .background(backgroundColor(for: code))
                            .cornerRadius(2)
                    }
                }
            }
            
            // Bottom row: Textual co-driver notes / instructions
            if !textComment.isEmpty {
                Text(textComment)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .textCase(.uppercase)
            }
            
            Spacer()
        }
        .padding(4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
    
    private var filteredCodes: [String] {
        lexiconCodes.filter { $0 != "!" && $0 != "!!" && $0 != "!!!" && $0 != "START" && $0 != "FINISH" }
    }
    
    @ViewBuilder
    private func waypointBadge(for wp: WaypointType) -> some View {
        switch wp {
        case .start:
            ZStack {
                Circle().stroke(Color.black, lineWidth: 1.5).frame(width: 26, height: 26)
                Text("START")
                    .font(.system(size: 7, weight: .black))
            }
        case .finish:
            ZStack {
                Circle().stroke(Color.black, lineWidth: 1.5).frame(width: 26, height: 26)
                Text("FINISH")
                    .font(.system(size: 7, weight: .black))
            }
        case .wpc:
            ZStack {
                Circle().stroke(Color.black, lineWidth: 1.5).frame(width: 26, height: 26)
                Text("WPC")
                    .font(.system(size: 8, weight: .black))
            }
        case .wps:
            ZStack {
                Circle().stroke(Color.black, lineWidth: 1.5).frame(width: 26, height: 26)
                Text("WPS")
                    .font(.system(size: 8, weight: .black))
            }
        case .wpm:
            ZStack {
                Circle().stroke(Color.black, lineWidth: 1.5).frame(width: 26, height: 26)
                Text("WPM")
                    .font(.system(size: 8, weight: .black))
            }
        case .dz:
            ZStack {
                Circle().fill(Color(red: 0.1, green: 0.7, blue: 0.3)).frame(width: 24, height: 24)
                Text("DZ")
                    .font(.system(size: 9, weight: .black))
                    .foregroundColor(.white)
            }
        case .fz:
            ZStack {
                Circle().fill(Color.gray).frame(width: 24, height: 24)
                Text("FZ")
                    .font(.system(size: 9, weight: .black))
                    .foregroundColor(.white)
            }
        case .cp:
            ZStack {
                Circle().stroke(Color.purple, lineWidth: 2).frame(width: 26, height: 26)
                Text("CP")
                    .font(.system(size: 9, weight: .black))
                    .foregroundColor(.purple)
            }
        default:
            EmptyView()
        }
    }
    
    private func backgroundColor(for code: String) -> Color {
        switch code.uppercased() {
        case "HP": return Color.orange.opacity(0.3)
        case "SA", "DN", "DN L1", "DN L2": return Color(red: 1.0, green: 0.9, blue: 0.4).opacity(0.6)
        case "DZ": return Color.green.opacity(0.3)
        case "FZ": return Color.gray.opacity(0.3)
        case "PP": return Color.blue.opacity(0.2)
        default: return Color.gray.opacity(0.15)
        }
    }
}
