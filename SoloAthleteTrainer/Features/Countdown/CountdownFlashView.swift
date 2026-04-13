import SwiftUI

struct CountdownFlashView: View {
    @State private var selectedSeconds = 10
    @State private var torchEnabled = true
    @State private var isRunning = false
    @State private var remainingSeconds = 0
    @State private var flashScreen = false

    private let timerService = TimerService()
    private let torchService = TorchService()
    private let hapticsService = HapticsService()
    private let audioService = AudioService()

    let quickOptions = [10, 20, 30, 45, 60]

    var body: some View {
        ZStack {
            (flashScreen ? Color.white : Color(.systemBackground))
                .ignoresSafeArea()

            Form {
                Section("Duration") {
                    Picker("Seconds", selection: $selectedSeconds) {
                        ForEach(quickOptions, id: \.self) { value in
                            Text("\(value)s").tag(value)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section {
                    Toggle("Torch at finish", isOn: $torchEnabled)
                }

                Section {
                    if isRunning {
                        Text("Remaining: \(remainingSeconds)s")
                            .font(.title3.weight(.semibold))
                        PrimaryButton(title: "Cancel", role: .destructive) {
                            cancelCountdown()
                        }
                    } else {
                        PrimaryButton(title: "Start Countdown") {
                            startCountdown()
                        }
                    }
                }
            }
            .opacity(flashScreen ? 0.05 : 1.0)
        }
        .navigationTitle("Countdown Flash")
    }

    private func startCountdown() {
        remainingSeconds = selectedSeconds
        isRunning = true

        timerService.startRepeatingTimer(interval: 1.0) {
            if remainingSeconds > 1 {
                remainingSeconds -= 1
                return
            }

            timerService.stop()
            isRunning = false
            remainingSeconds = 0
            triggerFinishAlert()
        }
    }

    private func cancelCountdown() {
        timerService.stop()
        isRunning = false
        remainingSeconds = 0
    }

    private func triggerFinishAlert() {
        audioService.playFinishCue()
        hapticsService.notifyWarning()

        if torchEnabled {
            torchService.flashBriefly()
        }

        withAnimation(.easeInOut(duration: 0.18)) {
            flashScreen = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.easeInOut(duration: 0.2)) {
                flashScreen = false
            }
        }
    }
}
