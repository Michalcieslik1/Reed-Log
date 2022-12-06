//
//  Tutorial1.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/27/22.
//

import SwiftUI

struct Tutorial1: View {
    var body: some View {
        VStack{
            Image("Main-Tutorial")
                .resizable()
                .frame(maxWidth: 200.0, maxHeight: 400)
            Text("The Reed Log project allows the player to enter reeds in a standardized format.")
        }
    }
}

struct Tutorial1_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial1()
    }
}
