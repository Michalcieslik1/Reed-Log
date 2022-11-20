//
//  ChartsInStatsView.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/19/22.
//

import SwiftUI
import SwiftUICharts

struct ChartsInStatsView: View {
    @ObservedObject var vm: StatsCalculations
    var body: some View {
        BarChartView(data: ChartData(values: [("Blanks",100), ("Scraped Reeds",40), ("Finished Reeds",70), ("Destoryed Reeds",200)]), title: "Sales", legend: "Quarterly", form: ChartForm.extraLarge)
    }
}

struct ChartsInStatsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        ChartsInStatsView(vm: StatsCalculations(context: viewContext))
    }
}
