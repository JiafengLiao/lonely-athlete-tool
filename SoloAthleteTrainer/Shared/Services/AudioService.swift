import AudioToolbox
import Foundation

struct AudioService {
    func playStarterCue() {
        AudioServicesPlaySystemSound(1113)
    }

    func playFinishCue() {
        AudioServicesPlaySystemSound(1005)
    }
}
