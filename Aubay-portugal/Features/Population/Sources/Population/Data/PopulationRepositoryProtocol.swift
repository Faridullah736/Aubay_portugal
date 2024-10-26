
import PopulationInfastructure

protocol PopulationRepositoryProtocol {

    func fetchPopulation(
        drilldowns: String,
        measures: String
    ) async throws -> PopulationDTO
}
