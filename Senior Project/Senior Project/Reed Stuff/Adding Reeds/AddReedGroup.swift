//
//  AddReedGroup.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/19/22.
//

import SwiftUI
import PopupView

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
            Button("Add Reed"){
                addReed()
            }
            .buttonStyle(.borderedProminent)
            
        }
        .navigationTitle("Add Reed")
        .popup(isPresented: $vm.errorPopUpVisible) {
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color.accentColor)
                        .frame(height: 50, alignment: .top)
                    Text(vm.title)
                        .bold()
                        .centerHorizontally()
                }
                Spacer()
                Text(vm.errorMessage)
                    .lineLimit(nil)
                    .centerHorizontally()
                Spacer()
                Button(vm.button){
                    vm.errorMessage = ""
                    vm.title = ""
                    vm.errorPopUpVisible.toggle()
                }.buttonStyle(.bordered)
                .frame(alignment: .bottom)
                Spacer()
            }
            .frame(minHeight: 150, maxHeight: 200)
            .background(Color(UIColor.systemBackground))
        } customize: {
            $0
                .type(.floater())
                .position(.top)
                .animation(.spring())
                .closeOnTapOutside(true)
                .backgroundColor(.black.opacity(0.5))
        }
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
