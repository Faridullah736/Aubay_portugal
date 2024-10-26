import XCTest
import Testing
@testable import Population
@testable import PopulationInfastructure

class MockPopulationRepository: PopulationRepositoryProtocol {
    var shouldReturnError: Bool = false
    var populationData: [Population] = []

    func fetchPopulation(drilldowns: String, measures: String) async throws -> PopulationDTO {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 1, userInfo: nil)
        }
        return PopulationDTO(data: populationData, source: [])
    }
}

final class PopulationViewModelTests: XCTestCase {
    var viewModel: PopulationViewModel!
    var mockRepository: MockPopulationRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockPopulationRepository()
        viewModel = PopulationViewModel()
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    func testLoadPopulationSuccess() async throws {
        await viewModel.loadPopulation("State")

        switch viewModel.population {
        case .loaded:
            XCTAssert(true, "Population data loaded.")
        case .failed:
            XCTFail("Population loading should not have failed.")
        case .loading:
            XCTFail("Population loading should be completed.")
        }
    }

    func testLoadPopulationFailure() async throws {
        mockRepository.shouldReturnError = true
        await viewModel.loadPopulation("")
        switch viewModel.population {
        case .loaded:
            XCTFail("Population loading should have failed.")
        case .failed(let error):
            XCTAssertNotNil(error, "Error should not be nil.")
        case .loading:
            XCTFail("Population loading should be in failed state.")
        }
    }
}

