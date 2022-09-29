//
//  Senior_ProjectApp.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/13/22.
//

import SwiftUI

@main
struct Senior_ProjectApp: App {
    //@StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            let viewContext = DataController.shared.container.viewContext
            ContentView(rvm: ReedListViewModel(context: viewContext), rbvm: ReedBoxListViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
