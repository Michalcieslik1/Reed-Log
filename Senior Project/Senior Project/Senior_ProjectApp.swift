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
                SearchView()
                    .tabItem{
                        Text("Search")
                    }
                    .tag(1)
                MainView(rvm: ReedListViewModel(context: viewContext), rbvm: ReedBoxListViewModel(context: viewContext))
                    .environment(\.managedObjectContext, viewContext)
                    .tabItem{
                        Text("Explore")
                    }
                    .tag(2)
                SettingsView()
                    .tabItem{
                        Text("Settings")
                    }
                    .tag(3)
            }
            //.tabViewStyle(.page)
        }
    }
}
