//
//  AddReedBox.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/14/22.
//

import SwiftUI

struct AddReedBox: View {
    @ObservedObject var vm: AddReedBoxViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("General")){
                    TextField("Name", text: $vm.name)
                    TextField("Size", value: $vm.size, formatter: NumberFormatter())
                    ColorPicker("Reed Box Color", selection: $vm.color)
                }
                Section(header:Text("Description")){
                    TextEditor(text: $vm.info)
                }
            }
            .navigationTitle("Create New Reed Box")
            Spacer()
            Button("Add Reed Case"){
                vm.save()
                dismiss()
            }
            .buttonStyle(BorderedButtonStyle())
        }
    }
}

struct AddReedBox_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        AddReedBox(vm: AddReedBoxViewModel(context: viewContext))
    }
}
