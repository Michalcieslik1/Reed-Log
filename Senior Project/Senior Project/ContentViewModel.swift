//
//  ContentViewModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/28/22.
//

import Foundation
import CoreData

class ContentViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate{
    private (set) var context: NSManagedObjectContext
    @Published var reeds = [Reed]()
    @Published var reedBoxes = [ReedBox]()
    
    private let reedFetchedResultsController: NSFetchedResultsController<Reed>
    private let reedBoxFetchedResultsController: NSFetchedResultsController<ReedBox>
    
    init(context: NSManagedObjectContext){
        self.context = context
        
        reedFetchedResultsController = NSFetchedResultsController(fetchRequest: Reed.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        reedBoxFetchedResultsController = NSFetchedResultsController(fetchRequest: ReedBox.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        reedFetchedResultsController.delegate = self
        reedBoxFetchedResultsController.delegate = self
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //guard for object in controller.fetchedObjects{
            print("Ji")
        //}
    }
}
