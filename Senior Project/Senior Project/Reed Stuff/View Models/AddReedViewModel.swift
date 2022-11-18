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
    @Published var notesVM: AddNoteViewModel
    @Published var stateVM: StateVM
    
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
    
    //@ObservedObject var showingAlert: Bool = false
    //@Published var errorMessage: String = ""
    
    init(context: NSManagedObjectContext, reedBoxes: ReedBoxListViewModel, notes: AddNoteViewModel, stateVM: StateVM){
        self.context = context
        self.reedBoxes = reedBoxes
        self.notesVM = notes
        self.stateVM = stateVM
        
        targetReedBox = stateVM.state.standardReed?.reedBox
        reedStage = Int(stateVM.state.standardReed?.reedStage ?? 0)
        
        caneType = stateVM.state.standardReed?.caneType ?? ""
        caneDiameter = String(stateVM.state.standardReed?.caneDiameter ?? 0)
        caneGouge = stateVM.state.standardReed?.caneGouge ?? ""
        caneShape = stateVM.state.standardReed?.caneShape ?? ""
        
        bottomLeft = stateVM.state.standardReed?.bottomL ?? 0
        bottomRight = stateVM.state.standardReed?.bottomR ?? 0
        leftL = stateVM.state.standardReed?.leftL ?? 0
        leftM = stateVM.state.standardReed?.leftM ?? 0
        leftR = stateVM.state.standardReed?.leftR ?? 0
        rightL = stateVM.state.standardReed?.rightL ?? 0
        rightM = stateVM.state.standardReed?.rightM ?? 0
        rightR = stateVM.state.standardReed?.rightR ?? 0
        
        stapleType = stateVM.state.standardReed?.stapleType ?? ""
        stapleID = stateVM.state.standardReed?.stapleID ?? ""
        tieLength = String(stateVM.state.standardReed?.tieLength ?? 0)
        threadColor = Color(hex: stateVM.state.standardReed?.threadColor ?? "") ?? Color.black
        
        reedSuccess = stateVM.state.standardReed?.reedSuccess ?? 0.0
        reedLoudness = stateVM.state.standardReed?.reedLoudness ?? 0.0
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
    /*
    func addNote(){
        let temp = Note(context: context)
        temp.id = UUID()
        temp.message = tempNote
        tempNote = ""
        temp.date = Date.now
        notes.append(temp)
    }
    
    func deleteNote(noteID: NSManagedObjectID){
        
    }
    */
    func save() -> Bool{
        let newReed = Reed(context: context)
        newReed.hidden = false
        
        if let rb = targetReedBox{
            if rb.size > rb.reedsSet.count{
                rb.addToReed(newReed)
            } else{
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
        newReed.caneGouge = caneGouge
        newReed.caneShape = caneShape
        newReed.stapleType = stapleType
        newReed.threadColor = threadColor.toHex()
        newReed.tieLength = tieLen
        
        newReed.reedSuccess = reedSuccess
        newReed.reedLoudness = reedLoudness
        
        newReed.notes = notesVM.getNotesList(reed: newReed)
        try? context.save()
        return true
    }
}
