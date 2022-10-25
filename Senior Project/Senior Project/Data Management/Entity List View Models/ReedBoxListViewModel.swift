//
//  ReedBoxListViewModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/17/22.
//

import Foundation
import CoreData
import SwiftUI

// Same as ReedListViewModel but for Reed Boxes
class ReedBoxListViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate{
    private (set) var context: NSManagedObjectContext
    @Published var reedBoxes = [ReedBox]()
    
    private let reedBoxFetchedResultsController: NSFetchedResultsController<ReedBox>
    
    init(context: NSManagedObjectContext){
        self.context = context
        
        reedBoxFetchedResultsController = NSFetchedResultsController(fetchRequest: ReedBox.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        reedBoxFetchedResultsController.delegate = self
        
        do{
            try reedBoxFetchedResultsController.performFetch()
            guard let reedBoxes = reedBoxFetchedResultsController.fetchedObjects else {
                return
            }
            
            self.reedBoxes = reedBoxes
        } catch {
            print(error)
        }
    }
    
    func deleteReedBox(reedBoxID: NSManagedObjectID){
        do {
            guard let reedBox = try context.existingObject(with: reedBoxID) as? ReedBox else{
                return
            }
            
            context.delete(reedBox)
            try? context.save()
        } catch {
            print(error)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let reedBoxes = controller.fetchedObjects as? [ReedBox] else {
            return
        }
        
        self.reedBoxes = reedBoxes
    }
    
    // TODO: add one for Notes object
}
