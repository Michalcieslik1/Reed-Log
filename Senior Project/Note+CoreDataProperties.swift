//
//  Note+CoreDataProperties.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/5/22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var message: String?
    @NSManaged public var date: Date?
    @NSManaged public var reed: Reed?

}

extension Note : Identifiable {

}
