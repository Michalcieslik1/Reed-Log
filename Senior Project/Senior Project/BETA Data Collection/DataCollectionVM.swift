//
//  DataCollectionVM.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/11/22.
//

import Foundation
import CoreData
import SwiftUI

class DataCollectionVM: NSObject, ObservableObject, NSFetchedResultsControllerDelegate{
    private (set) var context: NSManagedObjectContext
    @Published var saveFiles = [JSONData]()
    
    private let noteFetchedResultsController: NSFetchedResultsController<JSONData>
    
    init(context: NSManagedObjectContext){
        self.context = context
        
        noteFetchedResultsController = NSFetchedResultsController(fetchRequest: JSONData.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        noteFetchedResultsController.delegate = self
        
        do{
            try noteFetchedResultsController.performFetch()
            guard let files = noteFetchedResultsController.fetchedObjects else {
                return
            }
            
            self.saveFiles = files
        } catch {
            print(error)
        }
    }
    
    func save(reeds: ReedListViewModel){
        var jsonTemp = ""
        for reed in reeds.reeds{
            jsonTemp = jsonTemp.appending(reed.toJSON() ?? "")
        }
        print(jsonTemp)
        let temp = JSONData(context: context)
        temp.id = UUID()
        temp.date = Date()
        temp.data = jsonTemp
        
        try? context.save()
    }
    
    // Runs when something in the Core Data storage changes, and updates the reed array for the view
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let json = controller.fetchedObjects as? [JSONData] else {
            return
        }
        
        self.saveFiles = json
    }
    
    func deleteData(dataID: NSManagedObjectID){
        do {
            guard let json = try context.existingObject(with: dataID) as? JSONData else{
                return
            }
            context.delete(json)
            try? context.save()
        } catch {
            print(error)
        }
    }
}
