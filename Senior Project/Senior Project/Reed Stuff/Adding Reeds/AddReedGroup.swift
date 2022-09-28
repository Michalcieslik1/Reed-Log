//
//  AddReedGroup.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/19/22.
//

import SwiftUI

struct AddReedGroup: View {
    var body: some View {
        Group{
            TabView{
                //AddReed()
                AddReedQuestionaire()
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct AddReedGroup_Previews: PreviewProvider {
    static var previews: some View {
        AddReedGroup()
    }
}
