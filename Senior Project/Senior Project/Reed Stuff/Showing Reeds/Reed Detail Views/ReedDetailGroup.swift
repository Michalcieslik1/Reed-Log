//
//  ReedDetailGroup.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/2/22.
//

import SwiftUI

struct ReedDetailGroup: View {
    @ObservedObject var reed: Reed
    @ObservedObject var vm: EditReedViewModel
    
    init(vm: EditReedViewModel, reed: Reed){
        self.vm = vm
        self.reed = reed
    }
    
    var body: some View {
        VStack{
            TabView{
                ReedDetail(vm: vm, reed: reed)
                ReedDetailQuestionaire(vm: vm, reed: reed)
            }
            .tabViewStyle(.page)
        }
        .navigationTitle("#\(reed.stapleID ?? "Unknown") (Date)")
        .toolbar(){
            NavigationLink(destination: EditReedGroup(vm: EditReedViewModel(context: vm.context, reedBoxes: vm.reedBoxes, reedToEdit: reed))){
                Text("Edit")
            }
        }

    }
}

struct ReedDetailGroup_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        let tempReed = Reed(context: viewContext)
        ReedDetailGroup(vm: EditReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext), reedToEdit: Reed(context: viewContext)),reed: tempReed)
    }
}
