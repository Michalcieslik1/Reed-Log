//
//  AddReedViewModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/28/22.
//

import Foundation
import CoreData
import SwiftUI

class AddReedViewModel: ObservableObject{
    private (set) var context: NSManagedObjectContext
    
    @Published var reedBoxes: ReedBoxListViewModel
    
    @Published var targetReedBox: ReedBox?
    @Published var errorPopUpVisible: Bool = false
    @Published var message: String = ""
    @Published var title: String = ""
    @Published var button: String = ""
    var stages = ["Blank", "Scraped Reed", "In Use", "Destroyed"]
    
    @Published var name: String = ""
    @Published var reedStage = 0
    
    @Published var caneType: String = ""
    @Published var caneDiameter: String = ""
    @Published var caneGouge: String = ""
    @Published var caneShape: String = ""
    
    @Published var bottomLeft: Double = 0.0
    @Published var bottomRight: Double = 0.0
    @Published var leftL: Double = 0.0
    @Published var leftM: Double = 0.0
    @Published var leftR: Double = 0.0
    @Published var rightL: Double = 0.0
    @Published var rightM: Double = 0.0
    @Published var rightR: Double = 0.0
    
    @Published var stapleType: String = ""
    @Published var stapleID: String = ""
    @Published var tieLength: String = ""
    @Published var threadColor: Color = .white
    
    @Published var reedSuccess: Float = 5.0
    @Published var reedLoudness: Float = 5.0
    @Published var notes: [Note] = []
    @Published var tempNote = ""
    
    //@ObservedObject var showingAlert: Bool = false
    //@Published var errorMessage: String = ""
    
    init(context: NSManagedObjectContext, reedBoxes: ReedBoxListViewModel){
        self.context = context
        self.reedBoxes = reedBoxes
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
        let newReed = Reed(context: context)
        if let rb = targetReedBox{
            if rb.size > rb.reedsSet.count{
                rb.addToReed(newReed)
            } else{
                //throwReedError(error: "HI")
                context.delete(newReed)
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
        
        newReed.leftL = leftL
        newReed.leftM = leftM
        newReed.leftR = leftR
        newReed.bottomL = bottomLeft
        newReed.rightL = rightL
        newReed.rightM = rightM
        newReed.rightR = rightR
        newReed.bottomR = bottomRight
        
        newReed.stapleID = stapleID
        newReed.id = UUID()
        newReed.date = Date.now
        newReed.reedStage = Int16(exactly: reedStage)!
        newReed.caneType = caneType
        newReed.caneDiameter = diameter
        newReed.caneGouge = Double(caneGouge)!
        newReed.caneShape = caneShape
        newReed.stapleType = stapleType
        newReed.threadColor = threadColor.toHex()
        newReed.tieLength = tieLen
        
        newReed.reedSuccess = reedSuccess
        newReed.reedLoudness = reedLoudness
        
        for note in notes{
            note.reed = newReed
        }
        newReed.notes = NSSet(array: notes)
        
        try? context.save()
        print("Got here!")
        return true
    }
}
