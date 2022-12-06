//
//  Tutorial2.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/27/22.
//

import SwiftUI

struct Tutorial2: View {
    var body: some View {
        VStack{
            HStack{
                Image("Add-Obj-Tutorial")
                    .resizable()
                    .frame(maxWidth: 200.0, maxHeight: 400)
                Image("Add-Subj-Tutorial")
                    .resizable()
                    .frame(maxWidth: 200.0, maxHeight: 400)
            }
            Text("The purpose of the beta is to collect reed data, and analyze the relationship between physical reed attributes (left) and player experiences with the reed (right).")
        }
    }
}

struct Tutorial2_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial2()
    }
}
