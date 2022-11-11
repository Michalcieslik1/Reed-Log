//
//  AddReedBoxViewModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/1/22.
//

import Foundation
import CoreData
import SwiftUI

class AddReedBoxViewModel: ObservableObject{
    private (set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    @Published var name: String = ""
    @Published var info: String = ""
    @Published var size = 0
    @Published var color: Color = .white
    
    
    func save(){
        let reedBox = ReedBox(context: context)
        
        reedBox.hidden = false
        reedBox.id = UUID()
        reedBox.name = name
        reedBox.size = Int16(size)
        reedBox.info = info
        reedBox.color = color.toHex()
        
        try? context.save()
    }
}
