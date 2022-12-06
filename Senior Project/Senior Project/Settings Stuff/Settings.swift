//
//  Settings.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/17/22.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var stateVM: StateVM
    init(rvm: StateVM){
        self.stateVM = rvm
    }
    
    var body: some View {
            Section(header: Text("General")){
                //NavigationLink(<#LocalizedStringKey#>){
                    Text("Edit Standard Reed")
                    .bold()
                    .centerHorizontally()
                NavigationLink(destination: EditReedGroup(vm: EditReedViewModel(context: stateVM.context, reedBoxes: ReedBoxListViewModel(context: stateVM.context), reedToEdit: stateVM.state.standardReed!, notes: AddNoteViewModel(context: stateVM.context, notes: [])))){
                    ReedRow(reed: stateVM.state.standardReed!)
                }
            }
            //NavigationLink("Tutorial", destination: TutorialView())
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        Settings(rvm: StateVM(context: viewContext))
    }
}
