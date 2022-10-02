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
                Section{
                    Text("Pie Chart")
                }
                Section{
                    Text("Calendar")
                }
                Section{
                    Text("Rate of Success Graph")
                }
                Section{
                    Text("Use of Stuff Graph")
                }
                Button(action: {
                    print("Pressed")
                }, label: {
                    Text("Custom")
                })
                
            }
            .navigationTitle("Analysis")
        }
        
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
