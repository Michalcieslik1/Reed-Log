//
//  DataController.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/13/22.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "ReedModel")
    static let shared = DataController()
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
    //TODO: Move all the reed functions into here, like Add, remove etc
}
