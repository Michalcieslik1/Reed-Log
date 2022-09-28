//
//  AddReedQuestionaire.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/19/22.
//

import SwiftUI

struct AddReedQuestionaire: View {
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
        AddReedQuestionaire()
    }
}
