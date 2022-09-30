//
//  AddReedGroup.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/19/22.
//

import SwiftUI

struct AddReedGroup: View {
    @ObservedObject var vm: AddReedViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(vm: AddReedViewModel){
        self.vm = vm
    }
    
    var body: some View {
        VStack{
            TabView{
                //Text("Hey")
                AddReed(vm: vm)
                    .tabItem {
                        Text("HEY")
                    }
                AddReedQuestionaire(vm: vm)
            }
            .tabViewStyle(.page)
            Button("Add Reed"){
                addReed()
            }.buttonStyle(BorderedButtonStyle.bordered)
        }
        .navigationTitle("Add Reed")
        
    }
    
    func addReed(){
        vm.save()
        dismiss()
    }
}

struct AddReedGroup_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        AddReedGroup(vm: AddReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext)))
    }
}
