//
//  AddNoteViewModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/17/22.
//
import Foundation
import CoreData
import SwiftUI

class AddNoteViewModel: ObservableObject{
    private (set) var context: NSManagedObjectContext
    @Published public var notes: [Note] = []
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    init(context: NSManagedObjectContext, notes: [Note]){
        self.context = context
        self.notes = notes
    }
    
    init(context: NSManagedObjectContext, test: Bool){
        self.context = context
        if test{
            addNote(message: "Test 1")
            addNote(message: "Test 2")
        }
    }
    
    func addNote(message: String){
        let tempNote = Note(context: context)
        tempNote.message = message
        tempNote.date = Date.now
        tempNote.id = UUID()
        notes.append(tempNote)
    }
    
    func deleteNote(noteID: NSManagedObjectID){
        do {
            guard let note = try context.existingObject(with: noteID) as? Note else{
                return
            }
            notes.remove(at: notes.firstIndex(of: note)!)
            context.delete(note)
        } catch {
            print(error)
        }
    }
    
    func getNotesList(reed: Reed)-> NSSet{
        for note in notes{
            note.reed = reed
        }
        return NSSet(array: notes)
    }
}
