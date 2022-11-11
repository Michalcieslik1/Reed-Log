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
    }
    
}
