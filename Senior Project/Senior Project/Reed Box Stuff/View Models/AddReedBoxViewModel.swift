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
    @Published var errorPopUpVisible: Bool = false
    @Published var errorMessage: String = ""
    @Published var title: String = ""
    @Published var button: String = ""
    @Published var name: String = ""
    @Published var info: String = ""
    @Published var size = 20
    @Published var color: Color = .black
    
    
    func save() -> Bool{
        let reedBox = ReedBox(context: context)
        
        if name == ""{
            title = "Name Field Required"
            errorMessage = "You cannot leave the \"name\" field blank."
            button = "Ok"
            if !errorPopUpVisible{
                errorPopUpVisible.toggle()
            }
            context.delete(reedBox)
            return false
        }
        
        reedBox.hidden = false
        reedBox.id = UUID()
        reedBox.name = name
        reedBox.size = Int16(size)
        reedBox.info = info
        reedBox.color = color.toHex()
        
        try? context.save()
        return true
    }
}
