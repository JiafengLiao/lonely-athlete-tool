import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                TrainHomeView()
            }
            .tabItem {
                Label("Train", systemImage: "figure.run")
            }

            NavigationStack {
                HistoryView()
            }
            .tabItem {
                Label("History", systemImage: "clock.arrow.circlepath")
            }

            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
    }
}
