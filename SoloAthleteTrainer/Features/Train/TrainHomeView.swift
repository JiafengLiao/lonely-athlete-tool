import SwiftUI

struct TrainHomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                NavigationLink {
                    RandomStartView()
                } label: {
                    MetricCard(
                        title: "Random Start",
                        subtitle: "Unpredictable starter cue",
                        icon: "speaker.wave.3.fill"
                    )
                }
                .buttonStyle(.plain)

                NavigationLink {
                    CountdownFlashView()
                } label: {
                    MetricCard(
                        title: "Countdown Flash",
                        subtitle: "Timer with screen and torch alert",
                        icon: "timer"
                    )
                }
                .buttonStyle(.plain)

                NavigationLink {
                    VerticalTestView()
                } label: {
                    MetricCard(
                        title: "Vertical Test",
                        subtitle: "Calculate max jump height",
                        icon: "arrow.up"
                    )
                }
                .buttonStyle(.plain)

                NavigationLink {
                    SpeedTestView()
                } label: {
                    MetricCard(
                        title: "Speed Test",
                        subtitle: "Compute sprint speed",
                        icon: "speedometer"
                    )
                }
                .buttonStyle(.plain)
            }
            .padding()
        }
        .navigationTitle("Train")
    }
}
