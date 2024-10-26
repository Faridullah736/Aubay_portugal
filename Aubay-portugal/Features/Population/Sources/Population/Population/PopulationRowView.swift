
import PopulationInfastructure
import SwiftUI
import Foundation

public struct PopulationRowView: View {
    let state: String
    let population: Int
    let year: String
    let colName: String

    public init(state: String, population: Int, year: String, colName: String) {
        self.state = state
        self.population = population
        self.year = year
        self.colName = colName
    }

    public var body: some View {
        HStack {
            VStack(spacing: 10) {
                Text(colName)
                    .font(.headline)
                Text(state)
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            VStack(spacing: 10) {
                Text("Population")
                    .font(.headline)
                Text("\(population)")
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            VStack(spacing: 10) {
                Text("Year")
                    .font(.headline)
                Text(year)
                    .font(.system(size: 14))
            }.frame(maxWidth: .infinity)

        }
    }
}
