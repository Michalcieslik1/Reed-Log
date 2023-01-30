//
//  ReedDetailQuestionnaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/2/22.
//

import SwiftUI

struct ReedDetailQuestionnaire: View {
    @ObservedObject var reed: Reed
    
    init(reed: Reed){
        self.reed = reed
    }
    var body: some View {
        Section(header: Text("Questionnaire")){
            HStack{
                Text("Reed Success:")
                    .bold()
                Spacer()
                Text("\(Int(reed.reedSuccess))/10")
            }
            HStack{
                Text("Reed Loudness:")
                    .bold()
                Spacer()
                Text("\(Int(reed.reedLoudness))/10")
            }
            HStack{
                Text("Pitch Floor:")
                    .bold()
                Spacer()
                Text(reed.pitchFloorToString())
            }
            HStack{
                Text("Opening Size:")
                    .bold()
                Spacer()
                Text(reed.openingSizeToString())
            }
            HStack{
                Text("Deep:")
                    .bold()
                Spacer()
                Text(reed.toneDepthToString())
            }
            HStack{
                Text("Ringing:")
                    .bold()
                Spacer()
                Text(reed.toneRingToString())
            }
        }
    }
}

struct ReedDetailQuestionnaire_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        let tempReed = Reed(context: viewContext)
        ReedDetailQuestionnaire(reed: tempReed)
    }
}
