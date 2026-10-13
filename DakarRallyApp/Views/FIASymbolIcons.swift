import SwiftUI
public enum FIASymbolIcons {
    public struct UndulationIcon: View {
        public var body: some View {
            Canvas { context, size in
                var p = Path()
                let w = size.width
                let h = size.height * 0.5
                p.move(to: CGPoint(x: 2, y: h))
                p.addCurve(to: CGPoint(x: w * 0.5, y: h), control1: CGPoint(x: w * 0.25, y: h - 6), control2: CGPoint(x: w * 0.25, y: h + 6))
                p.addCurve(to: CGPoint(x: w - 2, y: h), control1: CGPoint(x: w * 0.75, y: h - 6), control2: CGPoint(x: w * 0.75, y: h + 6))
                context.stroke(p, with: .color(.black), lineWidth: 2)
            }
            .frame(width: 24, height: 14)
        }
    }
    public struct RutsIcon: View {
        public var body: some View {
            HStack(spacing: 4) {
                Text("{")
                    .font(.system(size: 14, weight: .black))
                Text("}")
                    .font(.system(size: 14, weight: .black))
            }
            .foregroundColor(.black)
        }
    }
    public struct CompressionIcon: View {
        public var body: some View {
            Canvas { context, size in
                let w = size.width
                let h = size.height
                var base = Path()
                base.move(to: CGPoint(x: 2, y: h - 2))
                base.addLine(to: CGPoint(x: w - 2, y: h - 2))
                context.stroke(base, with: .color(.black), lineWidth: 2)
                var arrow = Path()
                arrow.move(to: CGPoint(x: w * 0.5, y: 2))
                arrow.addLine(to: CGPoint(x: w * 0.5, y: h - 5))
                arrow.addLine(to: CGPoint(x: w * 0.25, y: h - 9))
                arrow.move(to: CGPoint(x: w * 0.5, y: h - 5))
                arrow.addLine(to: CGPoint(x: w * 0.75, y: h - 9))
                context.stroke(arrow, with: .color(.black), lineWidth: 2)
            }
            .frame(width: 16, height: 16)
        }
    }
    public struct DipIcon: View {
        public var body: some View {
            Canvas { context, size in
                let w = size.width
                let h = size.height
                var p = Path()
                p.move(to: CGPoint(x: 2, y: 4))
                p.addLine(to: CGPoint(x: w * 0.25, y: 4))
                p.addQuadCurve(to: CGPoint(x: w * 0.75, y: 4), control: CGPoint(x: w * 0.5, y: h - 2))
                p.addLine(to: CGPoint(x: w - 2, y: 4))
                context.stroke(p, with: .color(.black), lineWidth: 2)
            }
            .frame(width: 22, height: 14)
        }
    }
    public struct DitchIcon: View {
        public var body: some View {
            Canvas { context, size in
                let w = size.width
                let h = size.height
                var p = Path()
                p.move(to: CGPoint(x: 2, y: 3))
                p.addLine(to: CGPoint(x: w * 0.25, y: 3))
                p.addLine(to: CGPoint(x: w * 0.25, y: h - 3))
                p.addLine(to: CGPoint(x: w * 0.75, y: h - 3))
                p.addLine(to: CGPoint(x: w * 0.75, y: 3))
                p.addLine(to: CGPoint(x: w - 2, y: 3))
                context.stroke(p, with: .color(.black), lineWidth: 2)
            }
            .frame(width: 22, height: 14)
        }
    }
    public struct StepDownIcon: View {
        public var body: some View {
            Canvas { context, size in
                let w = size.width
                let h = size.height
                var p = Path()
                p.move(to: CGPoint(x: 2, y: 3))
                p.addLine(to: CGPoint(x: w * 0.5, y: 3))
                p.addLine(to: CGPoint(x: w * 0.5, y: h - 3))
                p.addLine(to: CGPoint(x: w - 2, y: h - 3))
                context.stroke(p, with: .color(.black), lineWidth: 2)
                var arr = Path()
                arr.move(to: CGPoint(x: w * 0.7, y: 5))
                arr.addLine(to: CGPoint(x: w * 0.85, y: 10))
                arr.addLine(to: CGPoint(x: w * 0.7, y: 15))
                context.stroke(arr, with: .color(.black), lineWidth: 1.5)
            }
            .frame(width: 22, height: 16)
        }
    }
    public struct DownhillArrowIcon: View {
        public var body: some View {
            Canvas { context, size in
                let w = size.width
                let h = size.height
                var tail = Path()
                tail.move(to: CGPoint(x: 2, y: 7))
                tail.addLine(to: CGPoint(x: 7, y: 2))
                context.stroke(tail, with: .color(.black), lineWidth: 2.8)
                var shaft = Path()
                shaft.move(to: CGPoint(x: 4.5, y: 4.5))
                shaft.addLine(to: CGPoint(x: w - 4, y: h - 4))
                context.stroke(shaft, with: .color(.black), lineWidth: 2.8)
                var head = Path()
                head.move(to: CGPoint(x: w - 2, y: h - 2))
                head.addLine(to: CGPoint(x: w - 9, y: h - 2))
                head.addLine(to: CGPoint(x: w - 2, y: h - 9))
                head.closeSubpath()
                context.fill(head, with: .color(.black))
            }
            .frame(width: 22, height: 22)
        }
    }
    public struct DuneRidgeShape: View {
        public var body: some View {
            Canvas { context, size in
                let w = size.width
                let h = size.height
                var p = Path()
                p.move(to: CGPoint(x: 0, y: h * 0.75))
                p.addCurve(to: CGPoint(x: w * 0.45, y: h * 0.15), control1: CGPoint(x: w * 0.15, y: h * 0.7), control2: CGPoint(x: w * 0.30, y: h * 0.2))
                p.addCurve(to: CGPoint(x: w, y: h * 0.8), control1: CGPoint(x: w * 0.65, y: h * 0.1), control2: CGPoint(x: w * 0.85, y: h * 0.65))
                p.addLine(to: CGPoint(x: w, y: h))
                p.addLine(to: CGPoint(x: 0, y: h))
                p.closeSubpath()
                context.fill(p, with: .color(Color(white: 0.55)))
            }
            .frame(width: 44, height: 16)
        }
    }
    public struct ClockIcon: View {
        public var body: some View {
            ZStack {
                Circle()
                    .stroke(Color.black, lineWidth: 1.5)
                    .frame(width: 18, height: 18)
                Path { p in
                    p.move(to: CGPoint(x: 9, y: 9))
                    p.addLine(to: CGPoint(x: 9, y: 4))
                    p.move(to: CGPoint(x: 9, y: 9))
                    p.addLine(to: CGPoint(x: 13, y: 9))
                }
                .stroke(Color.black, lineWidth: 1.5)
                .frame(width: 18, height: 18)
            }
        }
    }
    public struct StartFlagIcon: View {
        public var body: some View {
            ZStack {
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 24, height: 24)
                Text("START")
                    .font(.system(size: 6, weight: .black))
                    .foregroundColor(.black)
            }
        }
    }
    public struct CheckpointBadge: View {
        public var text: String = "CP"
        public var body: some View {
            ZStack {
                Circle()
                    .stroke(Color.purple, lineWidth: 2.2)
                    .frame(width: 24, height: 24)
                Text(text)
                    .font(.system(size: 8, weight: .black))
                    .foregroundColor(.purple)
            }
        }
    }
}
