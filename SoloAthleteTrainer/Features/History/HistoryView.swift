import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "clock.arrow.circlepath")
                .font(.system(size: 42))
                .foregroundStyle(.secondary)

            Text("History will appear here")
                .font(.headline)

            Text("In the next step, we can store test results and show personal bests.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .navigationTitle("History")
    }
}
