import SwiftUI

struct VerticalTestView: View {
    @State private var standingReach = ""
    @State private var jumpReach = ""
    @State private var result: Double?

    var body: some View {
        Form {
            Section("Input (cm)") {
                TextField("Standing reach", text: $standingReach)
                    .keyboardType(.decimalPad)

                TextField("Jump reach", text: $jumpReach)
                    .keyboardType(.decimalPad)
            }

            Section {
                PrimaryButton(title: "Calculate") {
                    let s = Double(standingReach) ?? 0
                    let j = Double(jumpReach) ?? 0
                    result = max(0, j - s)
                }
            }

            if let result {
                Section("Result") {
                    Text("Vertical: \(result, specifier: "%.1f") cm")
                        .font(.title3.bold())
                }
            }
        }
        .navigationTitle("Vertical Test")
    }
}
