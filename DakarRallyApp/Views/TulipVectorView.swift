import SwiftUI
public struct TulipVectorView: View {
    public let tulip: TulipDiagram
    public var isHighlighted: Bool = false
    public var noteId: Int = 1
    public init(tulip: TulipDiagram, isHighlighted: Bool = false, noteId: Int = 1) {
        self.tulip = tulip
        self.isHighlighted = isHighlighted
        self.noteId = noteId
    }
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
            GeometryReader { geo in
                let w = geo.size.width
                let h = geo.size.height
                let startX = w * 0.5
                let startY = h * 0.88
                Canvas { context, size in
                    let trackColor = Color.black
                    let strokeWidth: CGFloat = 3.2
                    var incomingPath = Path()
                    incomingPath.move(to: CGPoint(x: startX, y: startY))
                    incomingPath.addLine(to: CGPoint(x: startX, y: h * 0.52))
                    if tulip.isOffTrack {
                        context.stroke(incomingPath, with: .color(trackColor), style: StrokeStyle(lineWidth: strokeWidth, dash: [6, 4]))
                    } else {
                        context.stroke(incomingPath, with: .color(trackColor), style: StrokeStyle(lineWidth: strokeWidth))
                    }
                    var branchPath = Path()
                    let junction = CGPoint(x: startX, y: h * 0.52)
                    branchPath.move(to: junction)
                    let endPoint: CGPoint
                    switch tulip.turnType {
                    case .straight, .offTrackStraight:
                        endPoint = CGPoint(x: startX, y: h * 0.16)
                        branchPath.addLine(to: endPoint)
                    case .slightRight, .forkRight:
                        endPoint = CGPoint(x: w * 0.82, y: h * 0.22)
                        branchPath.addQuadCurve(to: endPoint, control: CGPoint(x: startX + 12, y: h * 0.38))
                        var straightGhost = Path()
                        straightGhost.move(to: junction)
                        straightGhost.addLine(to: CGPoint(x: startX, y: h * 0.22))
                        context.stroke(straightGhost, with: .color(.gray.opacity(0.4)), style: StrokeStyle(lineWidth: 1.8, dash: [4, 4]))
                    case .right:
                        endPoint = CGPoint(x: w * 0.88, y: h * 0.44)
                        branchPath.addQuadCurve(to: endPoint, control: CGPoint(x: startX + 18, y: h * 0.52))
                    case .sharpRight, .hairpinRight:
                        endPoint = CGPoint(x: w * 0.82, y: h * 0.74)
                        branchPath.addQuadCurve(to: endPoint, control: CGPoint(x: w * 0.90, y: h * 0.50))
                    case .slightLeft, .forkLeft, .offTrackLeft:
                        endPoint = CGPoint(x: w * 0.18, y: h * 0.22)
                        branchPath.addQuadCurve(to: endPoint, control: CGPoint(x: startX - 12, y: h * 0.38))
                        var straightGhost = Path()
                        straightGhost.move(to: junction)
                        straightGhost.addLine(to: CGPoint(x: startX, y: h * 0.22))
                        context.stroke(straightGhost, with: .color(.gray.opacity(0.4)), style: StrokeStyle(lineWidth: 1.8, dash: [4, 4]))
                    case .left:
                        endPoint = CGPoint(x: w * 0.12, y: h * 0.44)
                        branchPath.addQuadCurve(to: endPoint, control: CGPoint(x: startX - 18, y: h * 0.52))
                    case .sharpLeft, .hairpinLeft:
                        endPoint = CGPoint(x: w * 0.18, y: h * 0.74)
                        branchPath.addQuadCurve(to: endPoint, control: CGPoint(x: w * 0.10, y: h * 0.50))
                    case .offTrackRight:
                        endPoint = CGPoint(x: w * 0.80, y: h * 0.28)
                        branchPath.addLine(to: endPoint)
                    }
                    if tulip.isOffTrack {
                        context.stroke(branchPath, with: .color(trackColor), style: StrokeStyle(lineWidth: strokeWidth, dash: [6, 4]))
                    } else {
                        context.stroke(branchPath, with: .color(trackColor), style: StrokeStyle(lineWidth: strokeWidth))
                    }
                    drawArrowHead(context: context, at: endPoint, turnType: tulip.turnType)
                }
            }
            if tulip.hasDuneRidge || tulip.duneCount > 0 {
                VStack(spacing: 4) {
                    Spacer().frame(height: 32)
                    ForEach(0..<(max(1, tulip.duneCount)), id: \.self) { _ in
                        FIASymbolIcons.DuneRidgeShape()
                    }
                    Spacer()
                }
            }
            if let secText = tulip.secondaryBranchText {
                VStack {
                    Spacer().frame(height: 42)
                    HStack {
                        Spacer()
                        Text("\\\(secText)")
                            .font(.system(size: 11, weight: .black, design: .monospaced))
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                    }
                    Spacer()
                }
            }
            if noteId == 1 {
                HStack {
                    Spacer()
                    VStack(spacing: 2) {
                        FIASymbolIcons.StartFlagIcon()
                        FIASymbolIcons.ClockIcon()
                    }
                    .padding(.trailing, 8)
                }
            } else if noteId == 2 {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "stairs")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                            .padding(.top, 14)
                    }
                    Spacer()
                }
            }
            if tulip.headingCAP > 0 {
                VStack {
                    HStack {
                        if tulip.headingCAP >= 180 && tulip.turnType != .slightRight {
                            Text("\(tulip.headingCAP)°")
                                .font(.system(size: 13, weight: .black, design: .monospaced))
                                .foregroundColor(.black)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 1)
                                .background(Color(red: 1.0, green: 0.92, blue: 0.15))
                                .border(Color.black, width: 1.2)
                                .padding(4)
                            Spacer()
                        } else {
                            Spacer()
                            Text("\(tulip.headingCAP)°")
                                .font(.system(size: 13, weight: .black, design: .monospaced))
                                .foregroundColor(.black)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 1)
                                .background(Color(red: 1.0, green: 0.92, blue: 0.15))
                                .border(Color.black, width: 1.2)
                                .padding(4)
                        }
                    }
                    Spacer()
                }
            }
            if !tulip.extraLabels.isEmpty {
                VStack {
                    Spacer()
                    HStack(spacing: 3) {
                        ForEach(tulip.extraLabels, id: \.self) { label in
                            Text(label)
                                .font(.system(size: 8.5, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 3)
                                .padding(.vertical, 1)
                                .background(Color.white.opacity(0.9))
                        }
                        Spacer()
                    }
                    .padding(3)
                }
            }
        }
        .frame(minWidth: 80, minHeight: 90)
    }
    private func drawArrowHead(context: GraphicsContext, at point: CGPoint, turnType: TurnType) {
        var arrow = Path()
        let size: CGFloat = 8.0
        switch turnType {
        case .straight, .offTrackStraight:
            arrow.move(to: CGPoint(x: point.x, y: point.y - size))
            arrow.addLine(to: CGPoint(x: point.x - size * 0.7, y: point.y + size * 0.5))
            arrow.addLine(to: CGPoint(x: point.x + size * 0.7, y: point.y + size * 0.5))
        case .slightRight, .forkRight, .offTrackRight:
            arrow.move(to: CGPoint(x: point.x + size, y: point.y - size * 0.5))
            arrow.addLine(to: CGPoint(x: point.x - size, y: point.y - size * 0.2))
            arrow.addLine(to: CGPoint(x: point.x + size * 0.2, y: point.y + size))
        case .right:
            arrow.move(to: CGPoint(x: point.x + size, y: point.y))
            arrow.addLine(to: CGPoint(x: point.x - size * 0.5, y: point.y - size * 0.8))
            arrow.addLine(to: CGPoint(x: point.x - size * 0.5, y: point.y + size * 0.8))
        case .sharpRight, .hairpinRight:
            arrow.move(to: CGPoint(x: point.x + size, y: point.y + size))
            arrow.addLine(to: CGPoint(x: point.x - size * 0.8, y: point.y - size * 0.5))
            arrow.addLine(to: CGPoint(x: point.x + size * 0.8, y: point.y - size * 0.5))
        case .slightLeft, .forkLeft, .offTrackLeft:
            arrow.move(to: CGPoint(x: point.x - size, y: point.y - size * 0.5))
            arrow.addLine(to: CGPoint(x: point.x + size, y: point.y - size * 0.2))
            arrow.addLine(to: CGPoint(x: point.x - size * 0.2, y: point.y + size))
        case .left:
            arrow.move(to: CGPoint(x: point.x - size, y: point.y))
            arrow.addLine(to: CGPoint(x: point.x + size * 0.5, y: point.y - size * 0.8))
            arrow.addLine(to: CGPoint(x: point.x + size * 0.5, y: point.y + size * 0.8))
        case .sharpLeft, .hairpinLeft:
            arrow.move(to: CGPoint(x: point.x - size, y: point.y + size))
            arrow.addLine(to: CGPoint(x: point.x + size * 0.8, y: point.y - size * 0.5))
            arrow.addLine(to: CGPoint(x: point.x - size * 0.8, y: point.y - size * 0.5))
        }
        arrow.closeSubpath()
        context.fill(arrow, with: .color(.black))
    }
}
