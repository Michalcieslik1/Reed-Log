//
//  SettingsView.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/30/22.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var reedListVM: ReedListViewModel
    init(rvm: ReedListViewModel){
        self.reedListVM = rvm
    }
    
    var body: some View {
        NavigationView{
            List{
                Settings(rvm: StateVM(context: reedListVM.context))
                Link("Submit save file", destination: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdbussbA6dY0W6NT920FYsmsgufZmReKY1GGPpE54U8odo19g/viewform?usp=sf_link")!)
                    .centerHorizontally()
                    .buttonStyle(.borderedProminent)
                Section(){
                    NavigationLink(){
                        TutorialView()
                            .navigationTitle("Tutorial")
                    } label:{
                        Text("Tutorial - Study")
                            .bold()
                            .centerHorizontally()
                    }
                }.navigationTitle(Text("Settings"))
            }
            .toolbar(){
                ToolbarItem{
                    Button(){} label:{
                        VStack{
                            Image("Icon")
                        }
                    }
                }
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        SettingsView(rvm: ReedListViewModel(context: viewContext))
    }
}
