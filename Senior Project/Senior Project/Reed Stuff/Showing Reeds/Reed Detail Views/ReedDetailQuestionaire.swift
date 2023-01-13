//
//  ReedDetailQuestionaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/2/22.
//

import SwiftUI

struct ReedDetailQuestionaire: View {
    @ObservedObject var reed: Reed
    
    init(reed: Reed){
        self.reed = reed
    }
    var body: some View {
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
            HStack{
                Text("Opening Size:")
                Spacer()
                Text(reed.openingSizeToString())
            }
            HStack{
                Text("Deep:")
                Spacer()
                Text(reed.toneDepthToString())
            }
            HStack{
                Text("Ringing:")
                Spacer()
                Text(reed.toneRingToString())
            }
        }
    }
}

struct ReedDetailQuestionaire_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        let tempReed = Reed(context: viewContext)
        ReedDetailQuestionaire(reed: tempReed)
    }
}
