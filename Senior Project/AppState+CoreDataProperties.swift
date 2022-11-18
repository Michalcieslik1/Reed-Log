//
//  AppState+CoreDataProperties.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/15/22.
//
//

import Foundation
import CoreData


extension AppState {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<AppState> {
        return NSFetchRequest<AppState>(entityName: "AppState")
    }

    @NSManaged public var destroyedReeds: ReedBox?
    @NSManaged public var standardReed: Reed?
    
    static var all: NSFetchRequest<AppState>{
        let request = AppState.createFetchRequest()
        request.sortDescriptors = []
        return request
    }
}

extension AppState : Identifiable {

}
