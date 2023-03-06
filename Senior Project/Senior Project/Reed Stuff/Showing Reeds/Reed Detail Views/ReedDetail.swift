//
//  ReedDetail.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/14/22.
//

import SwiftUI

struct ReedDetail: View {
    @ObservedObject var reed: Reed
    
    init(reed: Reed){
        self.reed = reed
    }
    
    var body: some View {
        List{
            Section(header: Text("Reed Stage")){
                Text(reed.reedStageToString())
                .bold()
                .centerHorizontally()
            }
            Section(header: Text("Cane")){
                HStack{
                    Text("Type")
                        .font(.headline)
                    Spacer()
                    Text(reed.caneType ?? "Unknown")
                        .fontWeight(.light)
                }
                HStack{
                    Text("Diameter")
                        .font(.headline)
                    Spacer()
                    Text(String(reed.caneDiameter))
                        .fontWeight(.light)
                }
                HStack{
                    Text("Gouge")
                        .font(.headline)
                    Spacer()
                    Text(String(reed.caneGouge))
                        .fontWeight(.light)
                }
                HStack{
                    Text("Shape")
                        .font(.headline)
                    Spacer()
                    Text(reed.caneShape ?? "Unknown")
                        .fontWeight(.light)
                }
            }
            Section(header: Text("Cane Diagram")){
                CaneDiagram(reed: reed)//TODO: Cane Diagram
            }
            
            Section(header: Text("Tying Information")){
                HStack{
                    Text("Staple Type")
                        .font(.headline)
                    Spacer()
                    Text(reed.stapleType ?? "Unknown")
                        .fontWeight(.light)
                }
                HStack{
                    Text("Tie Length")
                        .font(.headline)
                    Spacer()
                    Text(String(reed.tieLength))
                        .fontWeight(.light)
                }
                HStack{
                    Text("Thread Color")
                        .font(.headline)
                    Spacer()
                    Circle()
                        .fill(Color(hex: reed.threadColor ?? "0") ?? .black)
                        .frame(width: 30, height: 30)
                        
                }
            }
            /*
            if (reed.reedStage >= 1){
                ReedDetailQuestionnaire(reed: reed)
            }*/
            
            Section(header: Text("Notes")){
                NoteRow(reed: reed)
            }
        }
        .toolbar(){
            //NavigationLink(destination: EditReed(reedToEdit: reed, reedToEditBox: reedBoxID)){
            //    Text("Edit")
            //}
        }
    }
}

struct ReedDetail_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        let tempReed = Reed(context: viewContext)
        ReedDetail(reed: tempReed)
    }
}
