//
//  Reed+CoreDataProperties.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/5/22.
//
//

import Foundation
import CoreData
import SwiftUI

extension Reed {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Reed> {
        return NSFetchRequest<Reed>(entityName: "Reed")
    }

    @NSManaged public var bottomL: Double
    @NSManaged public var bottomR: Double
    @NSManaged public var caneDiameter: Double
    @NSManaged public var caneGouge: Double
    @NSManaged public var caneShape: String?
    @NSManaged public var caneType: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var leftL: Double
    @NSManaged public var leftM: Double
    @NSManaged public var leftR: Double
    @NSManaged public var reedStage: Int16
    @NSManaged public var rightL: Double
    @NSManaged public var rightM: Double
    @NSManaged public var rightR: Double
    @NSManaged public var stapleID: String?
    @NSManaged public var stapleType: String?
    @NSManaged public var threadColor: String?
    @NSManaged public var tieLength: Double
    @NSManaged public var reedSuccess: Float
    @NSManaged public var reedLoudness: Float
    @NSManaged public var reedBox: ReedBox?
    @NSManaged public var notes: NSSet?

    public var notesSet: [Note]{
        Array(notes as? Set<Note> ?? [])
    }
    
    static var all: NSFetchRequest<Reed>{
        let request = Reed.createFetchRequest()
        request.sortDescriptors = []
        return request
    }
    
    func reedStageToString() -> String{
        switch reedStage{
        case 0:
            return "Blank"
        case 1:
            return "Scraped Reed"
        case 2:
            return "In Use"
        default:
            return "Destroyed"
        }
    }
    
    static func hexToColor(hex: String){
        //TODO
    }
    
    static func colorToHex(color: Color){
        //TODO
    }
}

extension Reed : Identifiable {

}
