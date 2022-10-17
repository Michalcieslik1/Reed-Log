//
//  NoteListViewModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/29/22.
//

import Foundation
import CoreData
import SwiftUI

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
