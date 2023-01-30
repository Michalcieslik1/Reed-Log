//
//  EditReedBoxModel.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/24/22.
//

import Foundation

import Foundation
import CoreData
import SwiftUI

class EditReedBoxViewModel: ObservableObject{
    private (set) var context: NSManagedObjectContext
    private (set) var reedBoxToEdit: ReedBox
    
    init(context: NSManagedObjectContext, reedBox: ReedBox){
        self.context = context
        self.reedBoxToEdit = reedBox
        
        self.name = reedBoxToEdit.name ?? ""
        self.info = reedBoxToEdit.info ?? ""
        self.color = Color(hex: reedBoxToEdit.color ?? "") ?? Color.white
        self.size = Int(reedBoxToEdit.size)
        self.id = reedBoxToEdit.id ?? UUID()
        self.reedBoxes = ReedBoxListViewModel(context: context)
    }
    
    @Published var errorPopUpVisible: Bool = false
    @Published var errorMessage: String = ""
    @Published var title: String = ""
    @Published var button: String = ""
    @Published var reedBoxes: ReedBoxListViewModel
    @Published var name: String
    @Published var info: String
    @Published var size: Int
    @Published var color: Color
    @Published var id: UUID
    
    
    func save() -> Bool{
        if name == ""{
            title = "Name Field Required"
            errorMessage = "You cannot leave the \"Name\" field blank."
            button = "Ok"
            if !errorPopUpVisible{
                errorPopUpVisible.toggle()
            }
            return false
        }
        reedBoxToEdit.id = id
        reedBoxToEdit.name = name
        reedBoxToEdit.size = Int16(size)
        reedBoxToEdit.info = info
        reedBoxToEdit.color = color.toHex()
        
        try? context.save()
        return true
    }
}
