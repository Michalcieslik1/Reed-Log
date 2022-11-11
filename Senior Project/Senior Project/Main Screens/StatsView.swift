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
            DataCollection(vm: DataCollectionVM(context: reedListVM.context), rlvm: reedListVM)
        }
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        AnalysisView(rvm: ReedListViewModel(context: viewContext))
    }
}
