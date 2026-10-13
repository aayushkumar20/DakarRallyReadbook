import Foundation
import AudioToolbox
import AVFoundation

public final class SoundEffectManager {
    public static let shared = SoundEffectManager()
    
    private init() {}
    
    public func playWaypointValidated() {
        // High beep / chime for WPT validated (ERTF beep)
        AudioServicesPlaySystemSound(1057) // SMS Received sound or ping
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    public func playDangerAlert() {
        // Loud double warning tone
        AudioServicesPlaySystemSound(1005) // Alarm
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    public func playSpeedExceededAlert() {
        // DZ overspeed warning buzzer
        AudioServicesPlaySystemSound(1053) // Tweet / alert
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
