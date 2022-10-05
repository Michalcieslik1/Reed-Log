//
//  ReedBoxPreview.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/14/22.
//

import SwiftUI

struct ReedBoxPreview: View {
    @ObservedObject var reedBox: ReedBox
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(hex: reedBox.color ?? "0") ?? Color(.white))
                .frame(width: 200, height: 200)
                .shadow(color: Color.gray, radius: 8)
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .opacity(0.3)
                .frame(width: 150, height: 150)
            ReedBoxName(name: reedBox.name ?? "Unknown", info: "\(reedBox.reedsSet.count)/\(reedBox.size)" )
                .frame(width: 140, height: 140)
        }
    }
}

struct ReedBoxPreview_Previews: PreviewProvider {
    static var previews: some View {
        ReedBoxPreview(reedBox: ReedBox())
    }
}
