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
    
    private var contentVM: ContentViewModel
    @State var isPresented = false
    
    init(vm: ContentViewModel){
        self.contentVM = vm
    }
    
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
                .sheet(isPresented: $isPresented, onDismiss:{
                    //Dismiss
                }, content:{
                    AddReed(vm: AddReedViewModel(context: moc))
                })
                Button("Add Reed"){
                    isPresented = true
                }
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
        let viewContext = DataController.shared.container.viewContext
        ContentView(vm: ContentViewModel(context: viewContext))
    }
}
