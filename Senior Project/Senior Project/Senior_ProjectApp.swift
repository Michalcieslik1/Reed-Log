//
//  Senior_ProjectApp.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/13/22.
//

import SwiftUI

@main
struct Senior_ProjectApp: App {
    @State private var selection = 2
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selection){
                let viewContext = DataController.shared.container.viewContext
                AnalysisView(rvm: ReedListViewModel(context: viewContext))
                    .tabItem{
                        Label("Data Collection", systemImage: "square.and.arrow.up.circle")
                    }
                    .tag(1)
                MainView(rvm: ReedListViewModel(context: viewContext), rbvm: ReedBoxListViewModel(context: viewContext))
                    .environment(\.managedObjectContext, viewContext)
                    .tabItem{
                        Label("Explore", systemImage: "book.circle")
                    }
                    .tag(2)
                SettingsView(rvm: ReedListViewModel(context: viewContext))
                    .tabItem{
                        Label("Settings", systemImage: "gearshape" )
                            
                    }
                    .tag(3)
            }
            //.tabViewStyle(.page)
        }
    }
}
