//
//  SettingsView.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/30/22.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var reedListVM: ReedListViewModel
    init(rvm: ReedListViewModel){
        self.reedListVM = rvm
    }
    
    var body: some View {
        Settings(rvm: StateVM(context: reedListVM.context))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        SettingsView(rvm: ReedListViewModel(context: viewContext))
    }
}
