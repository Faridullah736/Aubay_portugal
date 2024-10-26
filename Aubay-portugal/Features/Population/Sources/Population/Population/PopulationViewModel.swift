import Foundation
import PopulationInfastructure
import Utils

public final class PopulationViewModel: ObservableObject {
    @Published var population: AsyncState<[Population]> = .loading
    public init() {}
    
    public func loadPopulation( _ state: String) async {
        do {
            let request = try await PopulationRepository(
                populationClient: PopulationClient()
            ).fetchPopulation(
                drilldowns: state,
                measures: "Population"
            )
            await MainActor.run { [weak self] in
                guard let self else { return }
                self.population = .loaded(value: request.data ?? [])
            }
        } catch {
            await MainActor.run { [weak self] in
                guard let self else { return }
                self.population = .failed(error: error)
            }
        }
    }
}
