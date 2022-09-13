//
//  ContentView.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/13/22.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var reeds: FetchedResults<Reed>
    @FetchRequest(sortDescriptors: []) var reedBoxes: FetchedResults<ReedBox>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section(header: Text("Reed Boxes")){
                        ScrollView(.horizontal){
                            HStack{
                                Text("Reed Boxes")
                            }
                        }
                    }
                    Section(header:Text("Usable Reeds")){
                        ForEach(reeds){ reed in
                            ReedRow(reed: reed)
                        }
                    }
                }
                .navigationTitle("Reed Log")
                Button("Add"){
                    let newReed = Reed(context: moc)
                    newReed.id = UUID()
                    newReed.stapleID = "1234"
                    
                    try? moc.save()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
