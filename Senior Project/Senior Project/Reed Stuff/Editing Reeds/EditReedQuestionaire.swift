//
//  EditReedQuestionaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/5/22.
//

import SwiftUI

struct EditReedQuestionaire: View {
    @ObservedObject var vm: EditReedViewModel
    @State var showingAlert = false
    
    init(vm: EditReedViewModel){
        self.vm = vm
    }
    
    var body: some View {
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
            Text("Opening Size:")
                .bold()
                .centerHorizontally()
            Slider(value: $vm.openingSize, in: 1...5, step: 1){}
        minimumValueLabel: {
            Text("Small")
        } maximumValueLabel: {
            Text("Large")
        }.padding()
            Text("Tone")
                .bold()
                .centerHorizontally()
            HStack{
                Toggle(isOn: $vm.toneRing, label: {
                    Text("Ring")
                })
                Toggle("Depth", isOn: $vm.toneDepth)
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
