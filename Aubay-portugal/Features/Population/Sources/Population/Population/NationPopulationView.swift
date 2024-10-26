import SwiftUI

public struct NationPopulationView: View {
    @StateObject var viewModel: PopulationViewModel

    public init(viewModel: PopulationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        switch(viewModel.population) {
        case .loading:
            ProgressView()
                .progressViewStyle(.circular)
                .task {
                    await viewModel.loadPopulation("Nation")
                }
        case let .loaded(value:  population):
            PopulationListView(data: population, title: "Nation")
        case .failed:
            VStack {
                Spacer()
                Text("couldn´t fetch state population 🫣")
                Spacer()
            }
        }
    }
}
