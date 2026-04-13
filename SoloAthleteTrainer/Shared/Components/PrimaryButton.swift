import SwiftUI

struct PrimaryButton: View {
    let title: String
    var isDisabled = false
    var role: ButtonRole?
    let action: () -> Void

    var body: some View {
        Button(role: role, action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
        }
        .buttonStyle(.borderedProminent)
        .disabled(isDisabled)
    }
}
