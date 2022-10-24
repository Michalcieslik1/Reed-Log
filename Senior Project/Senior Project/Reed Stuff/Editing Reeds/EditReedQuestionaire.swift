//
//  EditReedQuestionaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/5/22.
//

import SwiftUI

struct EditReedQuestionaire: View {
    @ObservedObject var vm: EditReedViewModel
    @ObservedObject var noteVm: AddNoteViewModel
    @State var showingAlert = false
    
    init(vm: EditReedViewModel){
        self.vm = vm
        self.noteVm = vm.notesVm
    }
    
    var body: some View {
        ZStack{
            VStack{
                Form{
                    Section(header: Text("Questionaire")){
                        HStack{
                            Text("How successful is the reed:")
                            Spacer()
                            Text("\(Int(vm.reedSuccess))/10")
                        }
                        Slider(value: $vm.reedSuccess, in: 1...10, step: 1){}
                        minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("10")
                        }.padding()
                        HStack{
                            Text("How loud is the reed:")
                            Spacer()
                            Text("\(Int(vm.reedLoudness))/10")
                        }
                        Slider(value: $vm.reedLoudness, in: 1...10, step: 1){}
                        minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("10")
                        }.padding()
                        Text("Tone (TODO)")
                        Text("Experiment the reed takes part in")
                        Text("TODO")
                    }
                    Section(header: Text("Notes")){
                        AddNote(vm: noteVm)
                    }
                }
            }
        }
    }
}

struct EditReedQuestionaire_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        EditReedQuestionaire(vm: EditReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext), reedToEdit: Reed(context: viewContext), notes: AddNoteViewModel(context: viewContext)))
    }
}
