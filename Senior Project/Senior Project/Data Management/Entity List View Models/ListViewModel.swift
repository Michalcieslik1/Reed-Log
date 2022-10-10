//
//  ReedListViewModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/29/22.
//

import Foundation
import CoreData
import SwiftUI

// The View Model class for the list of Reeds, handling fethces, and updating lists. Stores the
//    non-core data list of reeds.
class ReedListViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate{
    private (set) var context: NSManagedObjectContext
    
    // Array of @Published Reed objects that's accesible by the view
    @Published var reeds = [Reed]()
    
    private let reedFetchedResultsController: NSFetchedResultsController<Reed>
    
    init(context: NSManagedObjectContext){
        self.context = context
        
        reedFetchedResultsController = NSFetchedResultsController(fetchRequest: Reed.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        reedFetchedResultsController.delegate = self
        
        do{
            try reedFetchedResultsController.performFetch()
            guard let reeds = reedFetchedResultsController.fetchedObjects else {
                return
            }
            
            self.reeds = reeds
        } catch {
            print(error)
        }
    }
    
    func deleteReed(reedID: NSManagedObjectID){
        do {
            guard let reed = try context.existingObject(with: reedID) as? Reed else{
                return
            }
            
            context.delete(reed)
        } catch {
            print(error)
        }
    }
    
    // Runs when something in the Core Data storage changes, and updates the reed array for the view
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let reeds = controller.fetchedObjects as? [Reed] else {
            return
        }
        
        self.reeds = reeds
    }
}


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

class NoteListViewModel : NSObject, ObservableObject, NSFetchedResultsControllerDelegate{
    private (set) var context: NSManagedObjectContext
    @Published var notes = [Note]()
    
    private let noteFetchedResultsController: NSFetchedResultsController<Note>
    
    init(context: NSManagedObjectContext){
        self.context = context
        
        noteFetchedResultsController = NSFetchedResultsController(fetchRequest: Note.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        noteFetchedResultsController.delegate = self
        
        do{
            try noteFetchedResultsController.performFetch()
            guard let notes = noteFetchedResultsController.fetchedObjects else {
                return
            }
            
            self.notes = notes
        } catch {
            print(error)
        }
    }
    
    func deleteNote(noteId: NSManagedObjectID){
        do {
            guard let note = try context.existingObject(with: noteId) as? Note else{
                return
            }
            
            context.delete(note)
        } catch {
            print(error)
        }
    }
}
