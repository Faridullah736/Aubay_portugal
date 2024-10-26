
import SwiftUI
import Population

struct ContentView: View {
    var body: some View {
        TabView {
            StatePopulationView(viewModel: PopulationViewModel())
                .tabItem {
                    Label("State", systemImage: "map")
                }
            NationPopulationView(viewModel: PopulationViewModel())
                .tabItem {
                    Label("Nation", systemImage: "globe")
                }
        }
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
