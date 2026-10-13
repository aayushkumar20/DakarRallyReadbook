import Foundation
import AudioToolbox
import AVFoundation
public final class SoundEffectManager {
    public static let shared = SoundEffectManager()
    private init() {}
    public func playWaypointValidated() {
        AudioServicesPlaySystemSound(1057)
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    public func playDangerAlert() {
        AudioServicesPlaySystemSound(1005)
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    public func playSpeedExceededAlert() {
        AudioServicesPlaySystemSound(1053)
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
