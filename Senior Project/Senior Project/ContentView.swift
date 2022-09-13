//
//  ContentView.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/13/22.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var reeds: FetchedResults<Reed>
    @FetchRequest(sortDescriptors: []) var reedBoxes: FetchedResults<ReedBox>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
