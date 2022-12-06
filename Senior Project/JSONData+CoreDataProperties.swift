//
//  JSONData+CoreDataProperties.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/11/22.
//
//

import Foundation
import CoreData
import SwiftUI
import UniformTypeIdentifiers

extension JSONData: Identifiable{

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<JSONData> {
        return NSFetchRequest<JSONData>(entityName: "JSONData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var data: String?
    @NSManaged public var date: Date?
    
    static var all: NSFetchRequest<JSONData>{
        let request = JSONData.createFetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \JSONData.date, ascending: false)]
        return request
    }
}

extension Reed {
  func toJSON() -> String? {
    let keys = Array(self.entity.attributesByName.keys)
    var dict = self.dictionaryWithValues(forKeys: keys)
      dict["id"] = self.id?.uuidString ?? ""
      dict["date"] = self.date?.toString()

    do {
        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        let reqJSONStr = String(data: jsonData, encoding: .utf8)
        return reqJSONStr
    }
    catch{}
    return nil
  }
}

extension Date{
    func toString() -> String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        return dateFormatter.string(from: self)
    }
}

// FileDocument?
