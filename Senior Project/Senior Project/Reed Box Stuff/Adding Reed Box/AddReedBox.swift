//
//  AddReedBox.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/14/22.
//

import SwiftUI

struct AddReedBox: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var info: String = ""
    @State private var size = 0
    @State private var color: Color = .white
    var body: some View {
        VStack{
            Form{
                Section(header: Text("General")){
                    TextField("Name", text: $name)
                    TextField("Size", value: $size, formatter: NumberFormatter())
                    ColorPicker("Reed Box Color", selection: $color)
                }
                Section(header:Text("Description")){
                    TextEditor(text: $info)
                }
            }
            .navigationTitle("Create New Reed Box")
            Spacer()
            Button("Add Reed Case"){
                addReedBox()
            }
            .buttonStyle(BorderedButtonStyle())
        }
    }
    
    func addReedBox(){
        let reedBox = ReedBox(context: moc)
        
        reedBox.id = UUID()
        reedBox.name = name
        reedBox.size = Int16(size)
        reedBox.info = info
        
        try? moc.save()
        dismiss()
    }
}

struct AddReedBox_Previews: PreviewProvider {
    static var previews: some View {
        AddReedBox()
    }
}
