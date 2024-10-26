import SwiftUI
import PopulationInfastructure

public struct PopulationListView: View {
    @State var data: [Population]
    var title: String

    public var body: some View {
        NavigationView {
            List(data) { data in
                PopulationRowView(state: (data.state ?? data.nation) ?? "", population: data.population ?? 0, year: data.year ?? "", colName: title)
            }
            .navigationTitle("USA \(title) Population")
            .navigationBarTitleDisplayMode(.inline) 
        }
    }
}
