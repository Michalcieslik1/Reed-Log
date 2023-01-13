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
    @State private var errorMessage: String = ""
    
    init(vm: AddReedViewModel){
        self.vm = vm
    }
    
    var body: some View {
        VStack{
            AddReed(vm: vm)
            .tabViewStyle(.page)
            Button("Add Reed"){
                addReed()
            }
            .buttonStyle(.borderedProminent)
            
        }
        .navigationTitle("Add Reed")
        //.alert("Incorrect Input", isPresented: vm.listenForAlert(), actions: {})
    }
    
    func addReed(){
        if vm.save(){
            dismiss()
        }
    }
}

struct AddReedGroup_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        AddReedGroup(vm: AddReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext), notes: AddNoteViewModel(context: viewContext), stateVM: StateVM(context: viewContext)))
    }
}
