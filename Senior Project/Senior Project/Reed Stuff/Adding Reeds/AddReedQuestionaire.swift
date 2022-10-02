//
//  AddReedQuestionaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/19/22.
//

import SwiftUI

struct AddReedQuestionaire: View {
    @ObservedObject var vm: AddReedViewModel
    
    init(vm: AddReedViewModel){
        self.vm = vm
    }
    
    var body: some View {
        ZStack{ //TODO: This whole section, including the data management
            VStack{
                Form{
                    Section(header:Text("Finished Reed Measurements")){
                        Text("HELLO")
                    }
                    Section(header: Text("Reed Tests")){
                        Text("Aspirated Attack Test")
                                .bold()
                                .centerHorizontally()
                        VStack{
                            HStack{
                                Text("Pitch of the Peep:")
                                Spacer()
                                Text(vm.peepPitchToString())
                            }
                            Slider(value: $vm.peepPitch, in: -200...200, step: 10)
                            HStack{
                                Text("Does the reed have a pitch ceiling?")
                                Spacer()
                                Picker("", selection: $vm.peepPitch) {
                                    Text("Yes").tag(true)
                                    Text("No").tag(false)
                                }.pickerStyle(.menu)
                            }
                            HStack{
                                Text("Is response immediate & cushioned?")
                                Spacer()
                                Picker("", selection: $vm.response) {
                                    Text("Yes").tag(true)
                                    Text("No").tag(false)
                                }.pickerStyle(.menu)
                            }
                        }
                        Text("Peep Tests")
                            .bold()
                            .centerHorizontally()
                        VStack{
                            Text("How resistant is the reed?").centerHorizontally()
                            Slider(value: $vm.resistance, in: -100...100, step: 50){
                                
                            } minimumValueLabel: {
                                Text("Too Easy")
                            } maximumValueLabel: {
                                Text("Too Hard")
                            }.padding()
                            Text("Tone (TODO)")
                        }
                        Text("Glissando Test")
                            .bold()
                            .centerHorizontally()
                        VStack{
                            HStack{
                                Text("Interval of the glissando:")
                                Spacer()
                                Text(vm.glissToString())
                            }
                            Slider(value: $vm.glissInterv, in: -3...3, step: 1)
                        }
                        Text("Thread Crow Test")
                            .bold()
                            .centerHorizontally()
                        VStack{
                            HStack{
                                Text("Pitch of the Peep:")
                                Spacer()
                                Text(vm.crowPitchToString())
                            }
                            Slider(value: $vm.crowPitch, in: -200...200, step: 10)
                            Text("Crow Interval")
                            Picker("", selection: $vm.crowInterv){
                                Text("No Crow").tag(-1)
                                Text("2 Octaves").tag(0)
                                Text("3 Octaves").tag(1)
                            }
                            .pickerStyle(.segmented)
                        }
                    }
                    Section(header: Text("Other")){
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
            AddReedQuestionaire(vm: AddReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext)))
        }
    }
}
