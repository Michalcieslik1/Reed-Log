//
//  EditReedGroup.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/5/22.
//

import SwiftUI

struct EditReedGroup: View {
    @ObservedObject var vm: EditReedViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var errorMessage: String = ""
    
    init(vm: EditReedViewModel){
        self.vm = vm
    }
    
    var body: some View {
        VStack{
            TabView{
                EditReed(vm: vm)
                EditReedQuestionaire(vm: vm)
            }
            .tabViewStyle(.page)
            Button("Save Changes"){
                saveChanges()
            }
            .buttonStyle(BorderedButtonStyle.bordered)
            
        }
        .navigationTitle("Add Reed")
        //.alert("Incorrect Input", isPresented: vm.listenForAlert(), actions: {})
    }
    
    func saveChanges(){
        if vm.save(){
            dismiss()
        }
    }
}

struct EditReedGroup_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        EditReedGroup(vm: EditReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext), reedToEdit: Reed(context: viewContext), notes: AddNoteViewModel(context: viewContext, test: true)))
    }
}
