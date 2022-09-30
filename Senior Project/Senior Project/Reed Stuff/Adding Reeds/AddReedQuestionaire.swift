//
//  AddReedQuestionaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/19/22.
//

import SwiftUI

struct AddReedQuestionaire: View {
    @ObservedObject var vm: AddReedViewModel
    
    init(vm: AddReedViewModel){
        self.vm = vm
    }
    
    var body: some View {
        ZStack{ //TODO: This whole section, including the data management
            VStack{
                Form{
                    Section(header:Text("Finished Reed Measurements")){
                        Text("Hello")
                    }
                    Section(header: Text("Reed Tests")){
                        Text("HELLO")
                    }
                    Section(header: Text("Other")){
                        Text("Hello")
                    }
                }
            }
        }
    }
}

struct AddReedQuestionaire_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        AddReedQuestionaire(vm: AddReedViewModel(context: viewContext, reedBoxes: ReedBoxListViewModel(context: viewContext)))
    }
}
