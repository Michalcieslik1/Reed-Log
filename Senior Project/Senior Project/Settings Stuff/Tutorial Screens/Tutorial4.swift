//
//  Tutorial3.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/27/22.
//

import SwiftUI

struct Tutorial4: View {
    var body: some View {
        VStack{
            HStack{
                Image("Settings-Tutorial")
                    .resizable()
                    .frame(maxWidth: 200.0, maxHeight: 400)
                Image("GoogleForm-Tutorial")
                    .resizable()
                    .frame(maxWidth: 200.0, maxHeight: 400)
            }
            Text("To submit the created file, press the \"Submit Save File\" Button. It will take you to a Google Form that will allow you to submit the saved data. If you need help troubleshooting, please reach out to me thorugh email or phone number.")
        }
    }
}

struct Tutorial4_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial4()
    }
}
