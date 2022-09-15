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
                                ForEach(reedBoxes){ reedBox in
                                    NavigationLink(destination: ReedBoxDetail(reedBox: reedBox)){
                                        ReedBoxPreview(reedBox: reedBox)
                                    }
                                }
                                NavigationLink(destination: AddReedBox()){
                                    NewReedBox()
                                        .padding(.all)
                                }
                            }
                        }
                    }
                    Section(header:Text("Usable Reeds")){
                        ForEach(reeds){ reed in
                            NavigationLink(destination: ReedDetail(reed: reed)) {
                                ReedRow(reed: reed)
                            }
                        }
                        .onDelete(perform: deleteReed)
                    }
                }
                .navigationTitle("Reed Log")
                NavigationLink("Add Reed", destination: AddReed())
                    .buttonStyle(BorderedButtonStyle.bordered)
            }
        }
    }
    func deleteReed(at offsets:IndexSet){
        for offset in offsets{
            let reed = reeds[offset]
            moc.delete(reed)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
