import Foundation

public protocol PopulationClientRepository {
    var baseURL: String { get }

    func fetchPopulation(
        drilldowns: String,
        measures: String
    ) async throws -> PopulationDTO
}

public class PopulationClient: PopulationClientRepository {

    enum NetworkError: Error {
        case badURL
        case decodingError
        case networkError(Error)
    }

    enum Endpoint {
        case population(drilldowns: String, measures: String)

        func toRestEndpoint() -> String {
            switch self {
            case .population(let drilldowns, let measures):
                var urlComponents = URLComponents(string: "/data")!
                urlComponents.queryItems = [
                    URLQueryItem(name: "drilldowns", value: drilldowns),
                    URLQueryItem(name: "measures", value: measures)
                ]
                return urlComponents.string ?? "/data"
            }
        }
    }

    public let baseURL: String

    public init(baseURL: String = "https://datausa.io/api") {
        self.baseURL = baseURL
    }

    private func fetch<Type: Decodable>(with endpoint: Endpoint) async throws -> Type {        guard let url = URL(string: baseURL + endpoint.toRestEndpoint()) else {
            throw NetworkError.badURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedType = try JSONDecoder().decode(Type.self, from: data)
            return decodedType
        } catch let error as DecodingError {
            throw NetworkError.decodingError
        } catch {
            throw NetworkError.networkError(error)
        }
    }

    public func fetchPopulation(
        drilldowns: String,
        measures: String
    ) async throws -> PopulationDTO {
        try await fetch(
            with: .population(
                drilldowns: drilldowns,
                measures: measures
            )
        )
    }
}

