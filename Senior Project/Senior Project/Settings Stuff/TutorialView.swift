//
//  TutorialView.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/22/22.
//

import SwiftUI

struct TutorialView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection){
            Tutorial1()
                .tag(0)
            Tutorial2()
                .tag(1)
            Tutorial3()
                .tag(2)
            Tutorial4()
                .tag(3)
        }
        .tabViewStyle(.page)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
