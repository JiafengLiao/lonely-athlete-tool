import SwiftUI

struct SettingsView: View {
    @State private var hapticsEnabled = true
    @State private var metricUnits = true

    var body: some View {
        Form {
            Section("Preferences") {
                Toggle("Enable haptics", isOn: $hapticsEnabled)
                Toggle("Use metric units", isOn: $metricUnits)
            }

            Section("Safety") {
                Text("Torch flashing may be uncomfortable for some users.")
                Text("Use only in safe training environments.")
            }

            Section("Disclaimer") {
                Text("This app is a training aid and not certified timing equipment.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Settings")
    }
}
