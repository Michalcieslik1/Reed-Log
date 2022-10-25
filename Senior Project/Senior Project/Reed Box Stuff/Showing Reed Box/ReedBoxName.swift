//
//  ReedBoxName.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/14/22.
//

import SwiftUI

struct ReedBoxName: View {
    var name: String
    var info: String
        
    var body: some View {
        VStack{
            Text(name)
                .font(.system(size: 300))  // 1
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top)
                .minimumScaleFactor(0.01)  // 2
            Text(info)
                .padding(.bottom)
        }
    }
}

struct ReedBoxName_Previews: PreviewProvider {
    static var previews: some View {
        ReedBoxName(name: "Main Reed Box", info: "1/20")
        ReedBoxName(name: "Workbench Pink Funky Reed Box", info: "132/500")
    }
}
