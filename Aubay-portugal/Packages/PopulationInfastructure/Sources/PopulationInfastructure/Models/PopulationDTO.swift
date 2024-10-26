import Foundation

public struct PopulationDTO : Codable, Hashable {
    public let data: [Population]?
    public let source: [SourceDTO]?
}

public struct Annotations: Codable, Hashable {
    public let source_name: String?
    public let source_description: String?
    public let dataset_name: String?
    public let dataset_link: String?
    public let table_id: String?
    public let topic: String?

    public static func stub(
        source_name: String? = String(),
        source_description: String? = String(),
        dataset_name: String? = String(),
        dataset_link: String? = String(),
        table_id: String? = String(),
        topic: String? = String()
    ) -> Self {
        Annotations(
            source_name: source_name,
            source_description: source_description,
            dataset_name: dataset_name,
            dataset_link: dataset_link,
            table_id: table_id,
            topic: topic
        )
    }
}

public struct Population: Codable, Hashable, Identifiable {
    public var id = UUID()
    public let id_Nation : String?
    public let id_State : String?
    public let state : String?
    public let nation : String?
    public let id_Year : Int?
    public let year : String?
    public let population : Int?
    public let slug_Nation : String?

    enum CodingKeys: String, CodingKey {
        case id_Nation = "ID Nation"
        case nation = "Nation"
        case state = "State"
        case id_State = "ID State"
        case id_Year = "ID Year"
        case year = "Year"
        case population = "Population"
        case slug_Nation = "Slug Nation"
    }

    public static func stub(
        id_Nation: String? = String(),
        id_State: String? = String(),
        state: String? = String(),
        nation: String? = String(),
        id_Year: Int? = Int(),
        year: String? = String(),
        population: Int? = Int(),
        slug_Nation: String? = String()
    ) -> Self {
        Population(
            id_Nation: id_Nation,
            id_State: id_State,
            state: state,
            nation: nation,
            id_Year: id_Year,
            year: year,
            population: population,
            slug_Nation: slug_Nation
        )
    }
}

public struct SourceDTO: Codable, Hashable {
    public let measures: [String]?
    public let annotations: Annotations?
    public let name: String?
    public let substitutions : [String]?

    public static func stub(
        measures: [String]? = [],
        annotations: Annotations? = .stub(),
        name: String? = String(),
        substitutions : [String]? = []
    ) -> Self {
        SourceDTO(
            measures: measures,
            annotations: annotations,
            name: name,
            substitutions: substitutions
        )
    }
}
