//
//  EditReedViewModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/5/22.
//

import Foundation
import CoreData
import SwiftUI

class EditReedViewModel: ObservableObject{
    
    private (set) var context: NSManagedObjectContext
    private (set) var reedToEdit: Reed
    
    @Published var reedBoxes: ReedBoxListViewModel
    
    @Published var targetReedBox: ReedBox?
    @Published var errorPopUpVisible: Bool = false
    @Published var message: String = ""
    @Published var title: String = ""
    @Published var button: String = ""
    var stages = ["Blank", "Scraped Reed", "In Use", "Destroyed"]
    
   // @Published var name: String
    @Published var reedStage: Int
    
    @Published var caneType: String
    @Published var caneDiameter: String
    @Published var caneGouge: String
    @Published var caneShape: String
    
    @Published var bottomLeft: Double
    @Published var bottomRight: Double
    @Published var leftL: Double
    @Published var leftM: Double
    @Published var leftR: Double
    @Published var rightL: Double
    @Published var rightM: Double
    @Published var rightR: Double
    
    @Published var stapleType: String
    @Published var stapleID: String
    @Published var tieLength: String
    @Published var threadColor: Color

    @Published var reedSuccess: Float
    @Published var reedLoudness: Float
    
    @Published var notes: [Note]
    @Published var tempNote: String
    
    //@ObservedObject var showingAlert: Bool = false
    //@Published var errorMessage: String = ""
    
    init(context: NSManagedObjectContext, reedBoxes: ReedBoxListViewModel, reedToEdit: Reed){
        self.context = context
        self.reedBoxes = reedBoxes
        self.reedToEdit = reedToEdit
        
        targetReedBox = reedToEdit.reedBox
        reedStage = Int(reedToEdit.reedStage)
        
        caneType = reedToEdit.caneType ?? ""
        caneDiameter = String(reedToEdit.caneDiameter)
        caneGouge = String(reedToEdit.caneGouge)
        caneShape = reedToEdit.caneShape ?? ""
        
        bottomLeft = reedToEdit.bottomL
        bottomRight = reedToEdit.bottomR
        leftL = reedToEdit.leftL
        leftM = reedToEdit.leftM
        leftR = reedToEdit.leftR
        rightL = reedToEdit.rightL
        rightM = reedToEdit.rightM
        rightR = reedToEdit.rightR
        
        stapleType = reedToEdit.stapleType ?? ""
        stapleID = reedToEdit.stapleID ?? ""
        tieLength = String(reedToEdit.tieLength)
        threadColor = Color(hex:reedToEdit.threadColor ?? "") ?? .orange
        
        reedSuccess = reedToEdit.reedSuccess
        reedLoudness = reedToEdit.reedLoudness
        notes = reedToEdit.notesSet
        tempNote = ""
    }
    /*
    func listenForAlert() -> Binding<Bool>{
        return $showingAlert
    }
    
    private func throwReedError(error: String){
        showingAlert.toggle()
        errorMessage = error
    }
    */
    
    func addNote(){
        let temp = Note(context: context)
        temp.id = UUID()
        temp.message = tempNote
        tempNote = ""
        temp.date = Date.now
        notes.append(temp)
    }
    
    func deleteNote(noteID: NSManagedObjectID){
        do {
            guard let note = try context.existingObject(with: noteID) as? Note else{
                return
            }
            
            context.delete(note)
        } catch {
            print(error)
        }
    }
    
    func save() -> Bool{
        if let rb = targetReedBox{
            if rb.size > rb.reedsSet.count{
                rb.addToReed(reedToEdit)
            } else{
                //throwReedError(error: "HI")
                context.delete(reedToEdit)
                return false
            }
        }
        
        guard let diameter = Double(caneDiameter) else{
            title = "Incorrect Input"
            message = "Diameter can only be a number"
            button = "Ok"
            errorPopUpVisible.toggle()
            return false
        }
        guard let tieLen = Double(tieLength) else{
            title = "Incorrect Input"
            message = "Tie Length can only be a number"
            button = "Ok"
            errorPopUpVisible.toggle()
            return false
        }
        
        reedToEdit.leftL = leftL
        reedToEdit.leftM = leftM
        reedToEdit.leftR = leftR
        reedToEdit.bottomL = bottomLeft
        reedToEdit.rightL = rightL
        reedToEdit.rightM = rightM
        reedToEdit.rightR = rightR
        reedToEdit.bottomR = bottomRight
        
        reedToEdit.stapleID = stapleID
        reedToEdit.id = reedToEdit.id
        reedToEdit.date = Date.now
        reedToEdit.reedStage = Int16(exactly: reedStage)!
        reedToEdit.caneType = caneType
        reedToEdit.caneDiameter = diameter
        reedToEdit.caneGouge = Double(caneGouge) ?? 1.0 //FIX THIS
        reedToEdit.caneShape = caneShape
        reedToEdit.stapleType = stapleType
        reedToEdit.threadColor = threadColor.toHex()
        reedToEdit.tieLength = tieLen
        
        reedToEdit.reedSuccess = reedSuccess
        reedToEdit.reedLoudness = reedLoudness
        
        for note in notes{
            note.reed = reedToEdit
        }
        reedToEdit.notes = NSSet(array: notes)
        
        try? context.save()
        return true
    }
}
