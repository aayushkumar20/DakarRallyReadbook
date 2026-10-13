import SwiftUI
public struct RemoteControlView: View {
    @ObservedObject var locationService: LocationService
    public init(locationService: LocationService) {
        self.locationService = locationService
    }
    public var body: some View {
        VStack(spacing: 6) {
            HStack {
                Text("TÉLÉCOMMANDE ERTF")
                    .font(.system(size: 9, weight: .black, design: .monospaced))
                    .foregroundColor(.gray)
                Spacer()
                Text("SENTINEL & TRIPMASTER")
                    .font(.system(size: 8, weight: .bold))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
            HStack(spacing: 12) {
                Button(action: {
                }) {
                    Text("ESC")
                        .font(.system(size: 11, weight: .black))
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(Color.red)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 2))
                }
                Button(action: {
                    if let stage = locationService.activeStage, stage.notes.indices.contains(locationService.telemetry.currentNoteIndex) {
                        locationService.toggleBiffage(for: locationService.telemetry.currentNoteIndex)
                    }
                }) {
                    Text("OK")
                        .font(.system(size: 11, weight: .black))
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .background(Color(red: 0.1, green: 0.85, blue: 0.3))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 2))
                }
                Button(action: {
                    SoundEffectManager.shared.playDangerAlert()
                }) {
                    Text("STN")
                        .font(.system(size: 11, weight: .black))
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .background(Color(red: 1.0, green: 0.85, blue: 0.0))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 2))
                }
                Spacer()
                Button(action: {
                    locationService.resetPartialOdo()
                }) {
                    VStack(spacing: 1) {
                        Text("TRIP")
                            .font(.system(size: 8, weight: .bold))
                        Text("RST")
                            .font(.system(size: 10, weight: .black))
                    }
                    .foregroundColor(.white)
                    .frame(width: 48, height: 44)
                    .background(Color.purple)
                    .cornerRadius(8)
                }
            }
            HStack(spacing: 8) {
                HStack(spacing: 4) {
                    Button(action: { locationService.adjustTotalOdo(by: 0.10) }) {
                        Text("+0.10")
                            .font(.system(size: 10, weight: .black))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .background(Color(red: 0.25, green: 0.25, blue: 0.3))
                            .cornerRadius(6)
                    }
                    Button(action: { locationService.adjustTotalOdo(by: -0.10) }) {
                        Text("-0.10")
                            .font(.system(size: 10, weight: .black))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .background(Color(red: 0.25, green: 0.25, blue: 0.3))
                            .cornerRadius(6)
                    }
                }
                Spacer()
                HStack(spacing: 6) {
                    Button(action: { locationService.previousNote() }) {
                        HStack(spacing: 2) {
                            Image(systemName: "chevron.up")
                            Text("NOTE -")
                                .font(.system(size: 9, weight: .black))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(6)
                    }
                    Button(action: { locationService.nextNote() }) {
                        HStack(spacing: 2) {
                            Text("NOTE +")
                                .font(.system(size: 9, weight: .black))
                            Image(systemName: "chevron.down")
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(6)
                    }
                }
            }
        }
        .padding(8)
        .background(Color(red: 0.12, green: 0.12, blue: 0.14))
        .border(Color.black, width: 2)
    }
}
