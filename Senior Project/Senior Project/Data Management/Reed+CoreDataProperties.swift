//
//  Reed+CoreDataProperties.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/15/22.
//
//

import Foundation
import CoreData


extension Reed {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Reed> {
        return NSFetchRequest<Reed>(entityName: "Reed")
    }

    @NSManaged public var caneDiameter: Double
    @NSManaged public var caneGouge: Double
    @NSManaged public var caneShape: String?
    @NSManaged public var caneType: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var reedStage: Int16
    @NSManaged public var stapleID: String?
    @NSManaged public var stapleType: String?
    @NSManaged public var threadColor: String?
    @NSManaged public var tieLength: Double
    @NSManaged public var reedBox: ReedBox?

}

extension Reed : Identifiable {

}
