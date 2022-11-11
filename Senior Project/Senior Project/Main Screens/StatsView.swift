//
//  SearchView.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/30/22.
//

import SwiftUI

struct AnalysisView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Save Data")){
                    Text("Reeds")
                }
                Button(action: {
                    print("Pressed")
                }, label: {
                    Text("Save")
                })
                
            }
            .navigationTitle("Data Collection")
        }
        
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
