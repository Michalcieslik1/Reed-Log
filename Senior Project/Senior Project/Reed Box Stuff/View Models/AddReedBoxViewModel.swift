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
    
    @State var name: String = ""
    @State var info: String = ""
    @State var size = 0
    @State var color: Color = .white
    
    
    func save(){
        let reedBox = ReedBox(context: context)
        
        reedBox.id = UUID()
        reedBox.name = name
        reedBox.size = Int16(size)
        reedBox.info = info
        
        try? context.save()
    }
}
