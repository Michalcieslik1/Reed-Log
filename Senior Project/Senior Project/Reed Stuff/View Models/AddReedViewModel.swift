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
    
    @Published var peepPitch: Float = 0.0
    @Published var pitchCeiling: Bool = true
    @Published var response: Bool = true
    @Published var resistance: Float = 0.0
    
    @Published var glissInterv: Float = 0.0
    @Published var crowPitch: Float = 0.0
    @Published var crowInterv: Int = 0
    @Published var reedSuccess: Float = 0.0
    @Published var reedLoudness: Float = 0.0
    
    init(context: NSManagedObjectContext, reedBoxes: ReedBoxListViewModel){
        self.context = context
        self.reedBoxes = reedBoxes
    }
    
    func peepPitchToString() -> String{
        switch peepPitch{
        case -200:
            return "B♭ (in tune)"
        case (-200)...(-101):
            return "B (\(abs(Int(peepPitch) + 100))cents flat)"
        case -100:
            return "B (in tune)"
        case (-99)...(-1):
            return "C (\(abs(Int(peepPitch))) cents flat)"
        case 0:
            return "C (in tune)"
        case 1...99:
            return "C (\(Int(peepPitch)) cents sharp)"
        case 100:
            return "C# (in tune)"
        case 200:
            return "D (in tune)"
        default:
            return "C# (\(Int(peepPitch) - 100) cents sharp)"
        }
    }
    
    func crowPitchToString() -> String{
        switch crowPitch{
        case -200:
            return "B (in tune)"
        case (-200)...(-101):
            return "C (\(abs(Int(crowPitch) + 100)) cents flat)"
        case -100:
            return "C (in tune)"
        case (-99)...(-1):
            return "C# (\(abs(Int(crowPitch))) cents flat)"
        case 0:
            return "C# (in tune)"
        case 1...99:
            return "C# (\(Int(crowPitch)) cents sharp)"
        case 100:
            return "D (in tune)"
        case 101...199:
            return "D (\(Int(crowPitch) - 100) cents sharp)"
        default:
            return "D# (in tune)"
        }
        
    }
    
    func glissToString() -> String{
        switch glissInterv{
        case -3:
            return "sharp major 2nd"
        case -2:
            return "major 2nd"
        case -1:
            return "sharp minor 3rd"
        case 0:
            return "minor 3rd"
        case 1:
            return "flat minor 3rd"
        case 2:
            return "major 3rd"
        default:
            return "flat major 3rd"
        }
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
        newReed.threadColor = "TODO" //TODO: Colors to hex and vice versa
        newReed.tieLength = tieLen
        targetReedBox!.addToReed(newReed)
        
        try? context.save()
    }
}
