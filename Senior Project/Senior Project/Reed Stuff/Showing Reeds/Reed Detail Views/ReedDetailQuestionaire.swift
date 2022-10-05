//
//  ReedDetailQuestionaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/2/22.
//

import SwiftUI

struct ReedDetailQuestionaire: View {
    @ObservedObject var reed: Reed
    @ObservedObject var vm: EditReedViewModel
    
    init(vm: EditReedViewModel, reed: Reed){
        self.vm = vm
        self.reed = reed
    }
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Questionaire")){
                    HStack{
                        Text("Reed Success:")
                        Spacer()
                        Text("\(Int(reed.reedSuccess))/10")
                    }
                    HStack{
                        Text("Reed Loudness:")
                        Spacer()
                        Text("\(Int(reed.reedLoudness))/10")
                    }
                }
                Section(header: Text("Notes")){
                    ForEach(reed.notesSet, id: \.self.id){ note in
                        VStack{
                            HStack{
                                Text("(Date)")
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            HStack{
                                Text(note.message ?? "")
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ReedDetailQuestionaire_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        let tempReed = Reed(context: viewContext)
        ReedDetailQuestionaire(vm:EditReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext), reedToEdit: Reed(context: viewContext)),reed: tempReed)
    }
}
