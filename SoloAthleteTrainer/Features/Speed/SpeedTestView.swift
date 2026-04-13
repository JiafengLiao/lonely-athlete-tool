import SwiftUI

struct SpeedTestView: View {
    @State private var distance: Double = 20
    @State private var timeSeconds = ""
    @State private var speed: Double?

    private let presets: [Double] = [10, 20, 30, 40]

    var body: some View {
        Form {
            Section("Distance (m)") {
                Picker("Distance", selection: $distance) {
                    ForEach(presets, id: \.self) { d in
                        Text("\(Int(d)) m").tag(d)
                    }
                }
                .pickerStyle(.segmented)
            }

            Section("Time (s)") {
                TextField("e.g. 3.42", text: $timeSeconds)
                    .keyboardType(.decimalPad)
            }

            Section {
                PrimaryButton(title: "Calculate Speed") {
                    let t = Double(timeSeconds) ?? 0
                    speed = t > 0 ? distance / t : nil
                }
            }

            if let speed {
                Section("Result") {
                    Text("\(speed, specifier: "%.2f") m/s")
                        .font(.title3.bold())
                }
            }
        }
        .navigationTitle("Speed Test")
    }
}
