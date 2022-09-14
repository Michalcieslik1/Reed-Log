//
//  ReedDetail.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/14/22.
//

import SwiftUI

struct ReedDetail: View {
    let reed: Reed
    var body: some View {
        List{
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
                //CaneDiagramDisplay(reed: reed)//TODO: Cane Diagram
                Text("Cane Diagram")
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
                        .fill(Color.blue)
                        //.fill(Reed.hexStringToUIColor(hex: reed.threadColor))TODO: Color to hex again
                        .frame(width: 30, height: 30)
                        
                }
            }
        }
        .navigationTitle("#\(reed.stapleID!) (Date)")
        .toolbar(){
            //NavigationLink(destination: EditReed(reedToEdit: reed, reedToEditBox: reedBoxID)){
            //    Text("Edit")
            //}
        }
    }
}

struct ReedDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReedDetail(reed: Reed())
    }
}
