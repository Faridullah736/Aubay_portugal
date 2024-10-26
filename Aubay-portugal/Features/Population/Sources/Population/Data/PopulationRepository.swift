import Foundation
import PopulationInfastructure

struct PopulationRepository: PopulationRepositoryProtocol {

    private let populationClient: PopulationClientRepository

    public init(populationClient: PopulationClientRepository) {
        self.populationClient = populationClient
    }

    func fetchPopulation(
        drilldowns: String,
        measures: String
    ) async throws -> PopulationDTO {
        try await populationClient
            .fetchPopulation(
                drilldowns: drilldowns,
                measures: measures
            )
    }
}
