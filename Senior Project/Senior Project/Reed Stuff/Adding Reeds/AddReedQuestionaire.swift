//
//  AddReedQuestionaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/19/22.
//

import SwiftUI

struct AddReedQuestionaire: View {
    @ObservedObject var vm: AddReedViewModel
    @ObservedObject var noteVm: AddNoteViewModel
    @State var showingAlert = false
    
    init(vm: AddReedViewModel){
        self.vm = vm
        noteVm = vm.notesVm
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

struct AddReedQuestionaire_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        Group {
            AddReedQuestionaire(vm: AddReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext), notes: AddNoteViewModel(context: viewContext)))
        }
    }
}
