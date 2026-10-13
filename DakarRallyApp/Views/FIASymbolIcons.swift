import SwiftUI

/// Vector-drawn exact FIA Dakar symbols matching Screenshots 2 & 3
public enum FIASymbolIcons {
    
    // MARK: - Undulations (∿∿)
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
    
    // MARK: - Ruts ({ })
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
    
    // MARK: - Compression (⤓)
    public struct CompressionIcon: View {
        public var body: some View {
            Canvas { context, size in
                let w = size.width
                let h = size.height
                // Ground baseline
                var base = Path()
                base.move(to: CGPoint(x: 2, y: h - 2))
                base.addLine(to: CGPoint(x: w - 2, y: h - 2))
                context.stroke(base, with: .color(.black), lineWidth: 2)
                
                // Downward compression arrow
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
    
    // MARK: - Dip (‿)
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
    
    // MARK: - Ditch (⎵)
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
    
    // MARK: - Step Down (↴)
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
                
                // Down arrow
                var arr = Path()
                arr.move(to: CGPoint(x: w * 0.7, y: 5))
                arr.addLine(to: CGPoint(x: w * 0.85, y: 10))
                arr.addLine(to: CGPoint(x: w * 0.7, y: 15))
                context.stroke(arr, with: .color(.black), lineWidth: 1.5)
            }
            .frame(width: 22, height: 16)
        }
    }
    
    // MARK: - Dunes (DN)
    public struct DunesIcon: View {
        public var body: some View {
            Canvas { context, size in
                let w = size.width
                let h = size.height
                var p = Path()
                p.move(to: CGPoint(x: 2, y: h - 3))
                p.addQuadCurve(to: CGPoint(x: w * 0.5, y: 4), control: CGPoint(x: w * 0.25, y: 4))
                p.addQuadCurve(to: CGPoint(x: w - 2, y: h - 3), control: CGPoint(x: w * 0.75, y: h - 2))
                context.stroke(p, with: .color(.black), lineWidth: 2)
            }
            .frame(width: 24, height: 14)
        }
    }
    
    // MARK: - Clock Icon
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
    
    // MARK: - Start Flag Circle Icon
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
    
    // MARK: - Checkpoint Badge (CP)
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
