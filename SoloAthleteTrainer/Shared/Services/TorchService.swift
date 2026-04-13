import AVFoundation
import Foundation

struct TorchService {
    func flashBriefly(duration: Double = 0.2) {
        guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else {
            return
        }

        do {
            try device.lockForConfiguration()
            device.torchMode = .on
            device.unlockForConfiguration()

            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                do {
                    try device.lockForConfiguration()
                    device.torchMode = .off
                    device.unlockForConfiguration()
                } catch {
                    // Intentionally ignored for baseline implementation.
                }
            }
        } catch {
            // Intentionally ignored for baseline implementation.
        }
    }
}
