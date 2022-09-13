//
//  Core_Data_TestApp.swift
//  Core Data Test
//
//  Created by Michał Cieslik on 9/13/22.
//

import SwiftUI

@main
struct Core_Data_TestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
