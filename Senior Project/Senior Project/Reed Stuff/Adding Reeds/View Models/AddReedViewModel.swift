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
    
    init(context: NSManagedObjectContext, reedBoxes: ReedBoxListViewModel){
        self.context = context
        self.reedBoxes = reedBoxes
    }
    
    func save(){
        let newReed = Reed(context: context)
        
        guard let diameter = Double(caneDiameter) else{
            title = "Incorrect Input"
            message = "Diameter can only be a number"
            button = "Ok"
            errorPopUpVisible.toggle()
            return
        }
        guard let tieLen = Double(tieLength) else{
            title = "Incorrect Input"
            message = "Tie Length can only be a number"
            button = "Ok"
            errorPopUpVisible.toggle()
            return
        }
        
        newReed.stapleID = stapleID
        newReed.id = UUID()
        newReed.date = Date.now
        newReed.reedStage = Int16(exactly: reedStage)!
        newReed.caneType = caneType
        newReed.caneDiameter = diameter
        newReed.caneGouge = Double(caneGouge)!
        newReed.caneShape = caneShape
        newReed.stapleType = stapleType
        newReed.threadColor = "TODO" //TODO: Colors to hex and vice versa
        newReed.tieLength = tieLen
        targetReedBox!.addToReed(newReed)
        
        try? context.save()
    }
}
