//
//  EditReedBox.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/24/22.
//

import SwiftUI
import PopupView

struct EditReedBox: View {
    @ObservedObject var reedListVM: ReedListViewModel
    @ObservedObject var vm: EditReedBoxViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("General")){
                    TextField("Name", text: $vm.name)
                    Picker("Size", selection: $vm.size) {
                        ForEach(1...100, id: \.self) { number in
                            Text("\(number)")
                        }
                    }
                    ColorPicker("Reed Box Color", selection: $vm.color)
                }
                Section(header:Text("Description")){
                    TextEditor(text: $vm.info)
                }
                HStack{
                    Spacer()
                    Text("\(vm.reedBoxToEdit.reedsSet.count)/\(vm.reedBoxToEdit.size)")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                ForEach(vm.reedBoxToEdit.reedsSet) { reed in
                    NavigationLink(destination: ReedDetailGroup(vm: EditReedViewModel(context: vm.context, reedBoxes: ReedBoxListViewModel(context: vm.context), reedToEdit: reed, notes: AddNoteViewModel(context: vm.context)), reed: reed)){
                        ReedRow(reed: reed)
                    }
                }
                .onDelete(perform: deleteReed)
                HStack{
                    Button(action: {self.deleteReedBox()}){
                        Text("Delete Reed Box")
                    }
                }
                .centerHorizontally()
            }
            .navigationTitle("Edit Reed Box")
            Spacer()
            Button("Save"){
                if (vm.save()){
                    dismiss()
                }
            }
            .buttonStyle(BorderedButtonStyle())
        }
        .environment(\.editMode, Binding.constant(EditMode.active))
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
    
    func deleteReed(at offsets:IndexSet){
        for offset in offsets {
            let reed = vm.reedBoxToEdit.reedsSet[offset]
            reedListVM.deleteReed(reedID: reed.objectID)
        }
    }
    
    func deleteReedBox(){
        vm.reedBoxes.deleteReedBox(reedBoxID: vm.reedBoxToEdit.objectID)
    }
}

struct EditReedBox_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        EditReedBox(reedListVM: ReedListViewModel(context: viewContext), vm: EditReedBoxViewModel(context: viewContext, reedBox: ReedBox(context: viewContext)))
    }
}
