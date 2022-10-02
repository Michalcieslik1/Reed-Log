//
//  CaneDiagram.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/30/22.
//

import SwiftUI

struct CaneDiagram: View {
    @ObservedObject var reed: Reed
    var body: some View {
        HStack{
            Text(String(reed.bottomL))
                .multilineTextAlignment(.center)
                .fixedSize()
            ZStack{
                Image("Cane Diagram")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(y:6)
                    .frame(minWidth:250, minHeight: 200)
                HStack{
                    VStack{
                        Text(String(reed.leftL))
                            .multilineTextAlignment(.center)
                            .fixedSize()
                        Text(String(reed.leftM))
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .padding()
                        Text(String(reed.leftR))
                            .multilineTextAlignment(.center)
                            .fixedSize()
                    }
                    VStack{
                        Text(String(reed.rightL))
                            .multilineTextAlignment(.center)
                            .fixedSize()
                        Text(String(reed.rightM))
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .padding()
                        Text(String(reed.rightR))
                            .multilineTextAlignment(.center)
                            .fixedSize()
                    }
                }
            }
            Text(String(reed.bottomR))
                .multilineTextAlignment(.center)
                .fixedSize()
        }
    }
}

struct CaneDiagram_Previews: PreviewProvider {
    static var previews: some View {
        CaneDiagram(reed: Reed())
    }
}
