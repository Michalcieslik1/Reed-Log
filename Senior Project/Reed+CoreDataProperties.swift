//
//  Reed+CoreDataProperties.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/19/22.
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
    @NSManaged public var caneGouge: String
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
    @NSManaged public var reedBox: ReedBox?
    @NSManaged public var notes: NSSet?
    @NSManaged public var hidden: Bool
    @NSManaged public var state: AppState?
    
    public var notesSet: [Note]{
        Array(notes as? Set<Note> ?? [])
    }
    
    static var all: NSFetchRequest<Reed>{
        let request = Reed.createFetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Reed.date, ascending: false)]
        request.predicate = NSPredicate(format: "hidden == %@", NSNumber(booleanLiteral: false))
        return request
    }
    
    static var hidden: NSFetchRequest<Reed>{
        let request = Reed.createFetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Reed.date, ascending: false)]
        request.predicate = NSPredicate(format: "hidden == %@", NSNumber(booleanLiteral: true))
        return request
    }
    
    func reedStageToString() -> String{
        Reed.reedStageToString(int: Int(reedStage))
    }
    
    static func reedStageToString(int: Int) -> String{
        switch int{
        case -1:
            return "All"
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
    
    static func dateToString(date: Date?) -> String{
        if let d = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: d)
        } else {return ""}
    }
}

extension Reed: Identifiable {
    
    func deleteNote(context: NSManagedObjectContext, note: Note){
        do {
            context.delete(note)
        } catch {
            print(error)
        }
    }
}
