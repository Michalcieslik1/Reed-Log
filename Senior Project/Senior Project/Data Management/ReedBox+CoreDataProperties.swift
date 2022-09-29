//
//  ReedBox+CoreDataProperties.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/15/22.
//
//

import Foundation
import CoreData


extension ReedBox {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<ReedBox> {
        return NSFetchRequest<ReedBox>(entityName: "ReedBox")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var size: Int16
    @NSManaged public var reed: NSSet?
    
    public var reedsSet: [Reed]{
        Array(reed as? Set<Reed> ?? [])
    }
}

// MARK: Generated accessors for reed
extension ReedBox {

    @objc(addReedObject:)
    @NSManaged public func addToReed(_ value: Reed)

    @objc(removeReedObject:)
    @NSManaged public func removeFromReed(_ value: Reed)

    @objc(addReed:)
    @NSManaged public func addToReed(_ values: NSSet)

    @objc(removeReed:)
    @NSManaged public func removeFromReed(_ values: NSSet)
    
    static var all: NSFetchRequest<ReedBox>{
        let request = ReedBox.createFetchRequest()
        request.sortDescriptors = []
        return request
    }
}

extension ReedBox : Identifiable {

}
