import SwiftUI
public struct DakarLogoView: View {
    public var size: CGFloat = 36
    public var color: Color = Color(red: 1.0, green: 0.92, blue: 0.15)
    public var showText: Bool = true
    public init(size: CGFloat = 36, color: Color = Color(red: 1.0, green: 0.92, blue: 0.15), showText: Bool = true) {
        self.size = size
        self.color = color
        self.showText = showText
    }
    public var body: some View {
        HStack(spacing: 8) {
            ZStack {
                Canvas { context, canvasSize in
                    let w = canvasSize.width
                    let h = canvasSize.height
                    var p = Path()
                    p.move(to: CGPoint(x: w * 0.50, y: h * 0.05))
                    p.addCurve(to: CGPoint(x: w * 0.85, y: h * 0.28), control1: CGPoint(x: w * 0.75, y: h * 0.05), control2: CGPoint(x: w * 0.88, y: h * 0.15))
                    p.addCurve(to: CGPoint(x: w * 0.72, y: h * 0.65), control1: CGPoint(x: w * 0.82, y: h * 0.40), control2: CGPoint(x: w * 0.80, y: h * 0.55))
                    p.addCurve(to: CGPoint(x: w * 0.88, y: h * 0.95), control1: CGPoint(x: w * 0.75, y: h * 0.75), control2: CGPoint(x: w * 0.85, y: h * 0.85))
                    p.addLine(to: CGPoint(x: w * 0.12, y: h * 0.95))
                    p.addCurve(to: CGPoint(x: w * 0.28, y: h * 0.65), control1: CGPoint(x: w * 0.15, y: h * 0.85), control2: CGPoint(x: w * 0.25, y: h * 0.75))
                    p.addCurve(to: CGPoint(x: w * 0.15, y: h * 0.28), control1: CGPoint(x: w * 0.20, y: h * 0.55), control2: CGPoint(x: w * 0.18, y: h * 0.40))
                    p.addCurve(to: CGPoint(x: w * 0.50, y: h * 0.05), control1: CGPoint(x: w * 0.12, y: h * 0.15), control2: CGPoint(x: w * 0.25, y: h * 0.05))
                    p.closeSubpath()
                    context.fill(p, with: .color(color))
                    var eyes = Path()
                    eyes.move(to: CGPoint(x: w * 0.32, y: h * 0.40))
                    eyes.addLine(to: CGPoint(x: w * 0.68, y: h * 0.40))
                    eyes.addLine(to: CGPoint(x: w * 0.65, y: h * 0.46))
                    eyes.addLine(to: CGPoint(x: w * 0.35, y: h * 0.46))
                    eyes.closeSubpath()
                    context.fill(eyes, with: .color(Color.black))
                    var fold1 = Path()
                    fold1.move(to: CGPoint(x: w * 0.30, y: h * 0.55))
                    fold1.addQuadCurve(to: CGPoint(x: w * 0.70, y: h * 0.55), control: CGPoint(x: w * 0.50, y: h * 0.62))
                    context.stroke(fold1, with: .color(Color.black), lineWidth: 1.5)
                    var fold2 = Path()
                    fold2.move(to: CGPoint(x: w * 0.25, y: h * 0.72))
                    fold2.addQuadCurve(to: CGPoint(x: w * 0.75, y: h * 0.72), control: CGPoint(x: w * 0.50, y: h * 0.80))
                    context.stroke(fold2, with: .color(Color.black), lineWidth: 1.5)
                }
                .frame(width: size, height: size)
            }
            if showText {
                VStack(alignment: .leading, spacing: -2) {
                    Text("DAKAR")
                        .font(.system(size: size * 0.48, weight: .black, design: .monospaced))
                        .foregroundColor(color)
                        .tracking(2.0)
                    Text("RALLY RAID")
                        .font(.system(size: size * 0.22, weight: .heavy))
                        .foregroundColor(.white)
                        .tracking(1.5)
                }
            }
        }
    }
}
