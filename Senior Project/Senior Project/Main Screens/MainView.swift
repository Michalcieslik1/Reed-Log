//
//  ContentView.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/13/22.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var reedListVM: ReedListViewModel
    @ObservedObject var reedBoxListVM: ReedBoxListViewModel
    @State var isPresented = false
    @State var showingAlert = false
    
    init(rvm: ReedListViewModel, rbvm: ReedBoxListViewModel){
        self.reedListVM = rvm
        self.reedBoxListVM = rbvm
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section(header: Text("Reed Boxes")){
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(reedBoxListVM.reedBoxes){ reedBox in
                                    NavigationLink(destination: ReedBoxDetail(vm: ReedListViewModel(context: moc), reedBox: reedBox, reedBoxVM: reedBoxListVM)){
                                        ReedBoxPreview(reedBox: reedBox)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                .onDelete(perform: deleteReedBox)
                                
                                NavigationLink(destination: AddReedBox(vm: AddReedBoxViewModel(context: moc))){
                                    NewReedBox()
                                        .padding(.all)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    Section(header:Text("Usable Reeds")){
                        ForEach(reedListVM.reeds){ reed in
                            NavigationLink(destination: ReedDetailGroup(vm:EditReedViewModel(context: reedBoxListVM.context, reedBoxes: reedBoxListVM, reedToEdit: reed, notes: AddNoteViewModel(context: moc)), reed: reed)) {
                                ReedRow(reed: reed)
                            }
                        }
                        .onDelete(perform: deleteReed)
                    }
                    HStack{
                        Spacer()
                        Button("Add Reed"){
                            isPresented = true
                        }
                        .buttonStyle(BorderedButtonStyle.bordered)
                        Spacer()
                    }
                }
                .navigationTitle("Reed Log")
                .sheet(isPresented: $isPresented, onDismiss:{
                    //Dismiss
                }, content:{
                    NavigationView{
                        AddReedGroup(vm: AddReedViewModel(context: moc, reedBoxes: reedBoxListVM, notes: AddNoteViewModel(context: moc)))
                    }
                    .navigationTitle("Add Reeds")
                })
            }
            .toolbar(){
                ToolbarItem{
                    Button(){} label:{
                        Image("Icon")
                    }
                }
            }
        }
    }
    
    func deleteReed(at offsets:IndexSet){
        for offset in offsets{
            let reed = reedListVM.reeds[offset]
            reedListVM.deleteReed(reedID: reed.objectID)
        }
    }
    
    func deleteReedBox(at offsets:IndexSet){
        for offset in offsets{
            let reedBox = reedBoxListVM.reedBoxes[offset]
            reedBoxListVM.deleteReedBox(reedBoxID: reedBox.objectID)
        }
    }
     
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        MainView(rvm: ReedListViewModel(context: viewContext), rbvm: ReedBoxListViewModel(context: viewContext))
    }
}
