//
//  Tutorial4.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/27/22.
//

import SwiftUI

struct Tutorial3: View {
    var body: some View {
        VStack{
            Image("DataCollection-Tutorial")
                .resizable()
                .frame(maxWidth: 200.0, maxHeight: 400)
            Text("After some time of normal use, please press Save in the Data Collection screen, and save the data on your device. Only reeds currently present in the app will be saved, so please only delete reeds after saving them.")
        }
    }
}

struct Tutorial3_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial3()
    }
}
