//
//  EditReed.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/5/22.
//

import SwiftUI

struct EditReed: View {
    @ObservedObject var vm: EditReedViewModel
    @ObservedObject var noteVm: AddNoteViewModel
    //@State var errorMe
    
    init(vm: EditReedViewModel){
        self.vm = vm
        self.noteVm = vm.notesVm
    }
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            VStack{
                Form{
                    Section(header: Text("General")){
                        if(vm.reedToEdit.hidden == false){
                            Picker("Reed Box", selection: $vm.targetReedBox){
                                ForEach(vm.reedBoxes.reedBoxes){ (reedBox: ReedBox) in
                                    Text(reedBox.name ?? "Unknown").tag(reedBox as ReedBox?)
                                }
                                Text("None").tag(nil as ReedBox?)
                            }
                        }
                        Picker("Reed Stage", selection: $vm.reedStage){
                            Text("Blank").tag(0)
                            Text("Scraped Reed").tag(1)
                            Text("In Use").tag(2)
                            Text("Destroyed").tag(3)
                        }
                    }
                    Section(header: Text("Cane")){
                        TextField("Type", text: $vm.caneType)
                        TextField("Diameter",text: $vm.caneDiameter)
                            .keyboardType(.decimalPad)
                        TextField("Gouge", text: $vm.caneGouge)
                        TextField("Shape", text: $vm.caneShape)
                        
                        ZStack{
                            Image("Cane Diagram")
                                .resizable()
                                .aspectRatio(CGSize(width:4, height: 3), contentMode: .fit)
                            HStack{
                                TextField("0", value: $vm.bottomLeft, formatter: NumberFormatter())
                                    .keyboardType(.decimalPad)
                                    .textFieldStyle(.roundedBorder)
                                    .multilineTextAlignment(.center)
                                    .padding(15)
                                    .offset(x: -10)
                                VStack{
                                    TextField("0", value: $vm.leftL, formatter: NumberFormatter())
                                        .keyboardType(.decimalPad)
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                        .offset(y: 25)
                                    TextField("0", value: $vm.leftM, formatter: NumberFormatter())
                                        .keyboardType(.decimalPad)
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                    TextField("0", value: $vm.leftR, formatter: NumberFormatter())
                                        .keyboardType(.decimalPad)
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                        .offset(y: -25)
                                }
                                VStack{
                                    TextField("0", value: $vm.rightL, formatter: NumberFormatter())
                                        .keyboardType(.decimalPad)
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                        .offset(y: 25)
                                    TextField("0", value: $vm.rightM, formatter: NumberFormatter())
                                        .keyboardType(.decimalPad)
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                    TextField("0", value: $vm.rightR, formatter: NumberFormatter())
                                        .keyboardType(.decimalPad)
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                        .offset(y: -25)
                                }
                                TextField("0", value: $vm.bottomRight, formatter: NumberFormatter())
                                    .keyboardType(.decimalPad)
                                    .textFieldStyle(.roundedBorder)
                                    .multilineTextAlignment(.center)
                                    .padding(15)
                                    .offset(x: 10)
                            }
                        }
                    }
                    Section(header: Text("Tying Information")){
                        TextField("Staple Type", text: $vm.stapleType)
                        TextField("Staple Number", text: $vm.stapleID)
                        TextField("Tie Length", text: $vm.tieLength)
                            .keyboardType(.decimalPad)
                        ColorPicker("Thread Color", selection: $vm.threadColor)
                    }
                    /*
                    if (vm.reedStage >= 1){
                        EditReedQuestionnaire(vm: vm)
                    }*/
                    
                    Section(header: Text("Notes")){
                        AddNote(vm: noteVm)
                    }
                }
            }
        }
    }
}


struct EditReed_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        EditReed(vm: EditReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext), reedToEdit: Reed(context: viewContext), notes: AddNoteViewModel(context: viewContext)))
    }
}
