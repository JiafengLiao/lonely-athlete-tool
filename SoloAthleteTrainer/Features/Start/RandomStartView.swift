import SwiftUI

struct RandomStartView: View {
    @State private var minDelay: Double = 1.5
    @State private var maxDelay: Double = 4.0
    @State private var hapticsEnabled = true
    @State private var isWaiting = false
    @State private var statusText = "Tap Ready to begin."

    private let audioService = AudioService()
    private let hapticsService = HapticsService()

    var body: some View {
        Form {
            Section("Delay Range (seconds)") {
                VStack(alignment: .leading) {
                    Text("Minimum: \(minDelay, specifier: "%.1f")")
                    Slider(value: $minDelay, in: 0.5...5, step: 0.1)
                }

                VStack(alignment: .leading) {
                    Text("Maximum: \(maxDelay, specifier: "%.1f")")
                    Slider(value: $maxDelay, in: 0.6...8, step: 0.1)
                }
            }

            Section {
                Toggle("Haptic Cue", isOn: $hapticsEnabled)
            }

            Section {
                Text(statusText)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                PrimaryButton(title: isWaiting ? "Waiting..." : "Ready", isDisabled: isWaiting) {
                    startRandomCue()
                }
            }
        }
        .navigationTitle("Random Start")
    }

    private func startRandomCue() {
        let clampedMax = max(maxDelay, minDelay + 0.1)
        let randomDelay = Double.random(in: minDelay...clampedMax)

        statusText = "Hold still... cue in \(randomDelay, specifier: "%.2f")s"
        isWaiting = true

        DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
            audioService.playStarterCue()
            if hapticsEnabled {
                hapticsService.notifySuccess()
            }
            statusText = "Go!"
            isWaiting = false
        }
    }
}
