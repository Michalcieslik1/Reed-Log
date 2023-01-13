//
//  AddReedQuestionaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/19/22.
//

import SwiftUI

struct AddReedQuestionaire: View {
    @ObservedObject var vm: AddReedViewModel
    @State var showingAlert = false
    
    init(vm: AddReedViewModel){
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

struct AddReedQuestionaire_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        Group {
            AddReedQuestionaire(vm: AddReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext), notes: AddNoteViewModel(context: viewContext), stateVM: StateVM(context: viewContext)))
        }
    }
}
