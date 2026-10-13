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
        VStack(alignment: .leading, spacing: 3) {
            HStack(spacing: 5) {
                if let wp = waypointType {
                    waypointBadge(for: wp)
                }
                if let limit = speedLimit {
                    ZStack {
                        Circle()
                            .stroke(Color.red, lineWidth: 2.5)
                            .background(Circle().fill(Color.white))
                            .frame(width: 26, height: 26)
                        Text("\(limit)")
                            .font(.system(size: 11, weight: .black))
                            .foregroundColor(.black)
                    }
                }
                if danger != .none {
                    HStack(spacing: 1) {
                        ForEach(0..<danger.rawValue, id: \.self) { _ in
                            Text("!")
                                .font(.system(size: 22, weight: .black, design: .serif))
                                .foregroundColor(.red)
                        }
                    }
                }
                if lexiconCodes.contains("OND") {
                    FIASymbolIcons.UndulationIcon()
                }
                if lexiconCodes.contains("ORNI") {
                    FIASymbolIcons.RutsIcon()
                }
                if lexiconCodes.contains("COMP") {
                    FIASymbolIcons.CompressionIcon()
                }
                if lexiconCodes.contains("DIP") {
                    FIASymbolIcons.DipIcon()
                }
                if lexiconCodes.contains("FOSS") {
                    FIASymbolIcons.DitchIcon()
                }
                if lexiconCodes.contains("DOWNHILL") || lexiconCodes.contains("DESCENTE") {
                    FIASymbolIcons.DownhillArrowIcon()
                }
                Spacer()
            }
            if !filteredCodes.isEmpty {
                HStack(spacing: 3) {
                    ForEach(filteredCodes, id: \.self) { code in
                        Text(code)
                            .font(.system(size: 11, weight: .black, design: .monospaced))
                            .foregroundColor(.black)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 1)
                            .background(backgroundColor(for: code))
                            .border(Color.black, width: 0.8)
                    }
                }
            }
            if !textComment.isEmpty {
                Text(textComment)
                    .font(.system(size: 9.5, weight: .bold))
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
        lexiconCodes.filter {
            $0 != "!" && $0 != "!!" && $0 != "!!!" &&
            $0 != "START" && $0 != "FINISH" &&
            $0 != "OND" && $0 != "ORNI" && $0 != "COMP" && $0 != "DIP" && $0 != "FOSS"
        }
    }
    @ViewBuilder
    private func waypointBadge(for wp: WaypointType) -> some View {
        switch wp {
        case .start:
            FIASymbolIcons.StartFlagIcon()
        case .finish:
            ZStack {
                Circle().stroke(Color.black, lineWidth: 2).frame(width: 24, height: 24)
                Text("ASS")
                    .font(.system(size: 7, weight: .black))
            }
        case .wpc:
            ZStack {
                Circle().stroke(Color.black, lineWidth: 1.8).frame(width: 24, height: 24)
                Text("WPC")
                    .font(.system(size: 7.5, weight: .black))
            }
        case .wps:
            ZStack {
                Circle().stroke(Color.black, lineWidth: 1.8).frame(width: 24, height: 24)
                Text("WPS")
                    .font(.system(size: 7.5, weight: .black))
            }
        case .wpm:
            ZStack {
                Circle().stroke(Color.black, lineWidth: 1.8).frame(width: 24, height: 24)
                Text("WPM")
                    .font(.system(size: 7.5, weight: .black))
            }
        case .dz:
            ZStack {
                Circle().fill(Color(red: 0.1, green: 0.7, blue: 0.3)).frame(width: 22, height: 22)
                Text("DZ")
                    .font(.system(size: 8.5, weight: .black))
                    .foregroundColor(.white)
            }
        case .fz:
            ZStack {
                Circle().fill(Color.gray).frame(width: 22, height: 22)
                Text("FZ")
                    .font(.system(size: 8.5, weight: .black))
                    .foregroundColor(.white)
            }
        case .cp:
            FIASymbolIcons.CheckpointBadge()
        default:
            EmptyView()
        }
    }
    private func backgroundColor(for code: String) -> Color {
        switch code.uppercased() {
        case "HP": return Color.orange.opacity(0.3)
        case "SA", "DN", "DN L1", "DN L2": return Color(red: 1.0, green: 0.9, blue: 0.4).opacity(0.7)
        case "DZ": return Color.green.opacity(0.3)
        case "FZ": return Color.gray.opacity(0.3)
        case "PP": return Color.blue.opacity(0.2)
        default: return Color.gray.opacity(0.15)
        }
    }
}
