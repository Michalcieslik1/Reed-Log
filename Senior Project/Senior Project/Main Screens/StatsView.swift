//
//  SearchView.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/30/22.
//

import SwiftUI

struct AnalysisView: View {
    @ObservedObject var reedListVM: ReedListViewModel
    
    init(rvm: ReedListViewModel){
        self.reedListVM = rvm
    }
    
    var body: some View {
        NavigationView{
                //ChartsInStatsView(vm: StatsCalculations(context: reedListVM.context))
                    //.scaledToFill()
            List{
                DataCollection(vm: DataCollectionVM(context: reedListVM.context), rlvm: reedListVM)
            }
            .navigationTitle("Data Collection")
            .toolbar(){
                ToolbarItem{
                    Button(){} label:{
                        VStack{
                            Image("Icon")
                            Text("Beta")
                        }
                    }
                }
            }
            
        }
        
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        AnalysisView(rvm: ReedListViewModel(context: viewContext))
    }
}
