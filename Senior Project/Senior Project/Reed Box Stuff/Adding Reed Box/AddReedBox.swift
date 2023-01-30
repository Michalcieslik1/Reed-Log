//
//  AddReedBox.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/14/22.
//

import SwiftUI
import PopupView

struct AddReedBox: View {
    @ObservedObject var vm: AddReedBoxViewModel
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
            }
            .navigationTitle("Create New Reed Box")
            Spacer()
            Button("Add Reed Case"){
                if (vm.save()){
                    dismiss()
                }
            }
            .buttonStyle(BorderedButtonStyle())
        }
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
}

struct AddReedBox_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        AddReedBox(vm: AddReedBoxViewModel(context: viewContext))
    }
}
