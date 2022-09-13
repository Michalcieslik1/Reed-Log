//
//  ReedRow.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/13/22.
//

import SwiftUI

struct ReedRow: View {
    let reed: Reed
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .padding(5)
            VStack(alignment: .leading){
                Text(reed.stapleID!)
                    .font(.headline)
            }
            Spacer()
            Text("Reed Stage")
                .font(.headline)
                .padding()
        }
    }
}

struct ReedRow_Previews: PreviewProvider {
    static var previews: some View {
        ReedRow(reed: Reed())
    }
}
