//
//  EditReedGroup.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/5/22.
//

import SwiftUI
import PopupView

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
            }
            .tabViewStyle(.page)
            Button("Save Changes"){
                saveChanges()
            }
            .buttonStyle(BorderedButtonStyle.bordered)
            
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
