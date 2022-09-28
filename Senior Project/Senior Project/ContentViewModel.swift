//
//  ContentViewModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/28/22.
//

import Foundation
import CoreData

class ContentViewModel: ObservableObject{
    private (set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
}
