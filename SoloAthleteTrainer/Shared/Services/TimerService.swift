import Foundation

final class TimerService {
    private var timer: Timer?

    func startRepeatingTimer(interval: TimeInterval, tick: @escaping () -> Void) {
        stop()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            tick()
        }
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
