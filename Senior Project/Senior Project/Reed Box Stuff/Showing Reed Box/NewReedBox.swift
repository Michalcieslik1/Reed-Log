//
//  NewReedBox.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/14/22.
//

import SwiftUI

struct NewReedBox: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(UIColor.lightGray))
                .frame(width: 200, height: 200)
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .opacity(0.3)
                .frame(width: 150, height: 150)
            Text("+")
                .font(.system(size: 300))  // 1
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .offset(y: -5)
                .minimumScaleFactor(0.01)  // 2
                .frame(width: 100, height: 100)
        }
    }
}

struct NewReedBox_Previews: PreviewProvider {
    static var previews: some View {
        NewReedBox()
    }
}
