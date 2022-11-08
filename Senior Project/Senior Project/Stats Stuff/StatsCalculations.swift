//
//  StatsCalculations.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/8/22.
//

import Foundation
import Foundation
import CoreData
import SwiftUI

class StatsCalculations: ObservableObject{
    private (set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func reedMakeup() -> Int {
        
        return 1
    }
}

class ReedData: ObservableObject {
    
}
