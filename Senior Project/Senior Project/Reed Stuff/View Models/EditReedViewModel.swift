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
    @Published var notesVm: AddNoteViewModel
    
    @Published var targetReedBox: ReedBox?
    @Published var errorPopUpVisible: Bool = false
    @Published var errorMessage: String = ""
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

    @Published var hidden: Bool
    //@Published var tempNote: String
    
    //@ObservedObject var showingAlert: Bool = false
    //@Published var errorMessage: String = ""
    
    init(context: NSManagedObjectContext, reedBoxes: ReedBoxListViewModel, reedToEdit: Reed, notes: AddNoteViewModel){
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
        hidden = reedToEdit.hidden
        
        self.notesVm = notes
        self.notesVm.notes = reedToEdit.notesSet
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
    
    func save() -> Bool{
        if !hidden{
            if let rb = targetReedBox{
                if rb.size > rb.reedsSet.count{
                    rb.addToReed(reedToEdit)
                } else{
                    title = "Reedbox Full"
                    errorMessage = "The chosen reedbox is full. Please choose another reedbox."
                    button = "Ok"
                    if !errorPopUpVisible{
                        errorPopUpVisible.toggle()
                    }
                    return false
                }
            }
        }
        
        guard let diameter = Double(caneDiameter) else{
            title = "Incorrect Input"
            errorMessage = "Diameter can only be a number"
            button = "Ok"
            errorPopUpVisible.toggle()
            return false
        }
        guard let tieLen = Double(tieLength) else{
            title = "Incorrect Input"
            errorMessage = "Tie Length can only be a number"
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
        reedToEdit.reedStage = Int16(exactly: reedStage)!
        reedToEdit.caneType = caneType
        reedToEdit.caneDiameter = diameter
        reedToEdit.caneGouge = caneGouge
        reedToEdit.caneShape = caneShape
        reedToEdit.stapleType = stapleType
        reedToEdit.threadColor = threadColor.toHex()
        reedToEdit.tieLength = tieLen
        
        
        for note in notesVm.notes{
            note.reed = reedToEdit
        }
        reedToEdit.notes = NSSet(array: notesVm.notes)
        
        try? context.save()
        return true
    }
}
