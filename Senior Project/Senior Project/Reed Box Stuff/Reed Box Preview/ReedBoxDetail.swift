//
//  ReedBoxDetail.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/15/22.
//

import SwiftUI

struct ReedBoxDetail: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var reedBox: ReedBox
    
    var body: some View {
        VStack{
            List{
                Section{
                    Text(reedBox.info ?? "")
                }
                HStack{
                    Spacer()
                    Text("\(reedBox.reedsSet.count)/\(reedBox.size)")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                ForEach(reedBox.reedsSet) { reed in
                    NavigationLink(destination: ReedDetail(reed: reed)){
                        ReedRow(reed: reed)
                    }
                }
                .onDelete(perform: deleteReed)
            }
            .navigationTitle(reedBox.name ?? "Unknown")
            .toolbar {
                EditButton()
            }
            //NavigationLink("Add Reed", destination:
                               // AddReed())
            .buttonStyle(BorderedButtonStyle.bordered)
        }
    }
    func deleteReed(at offsets:IndexSet){
        for offset in offsets{
            let reed = reedBox.reedsSet[offset]
            moc.delete(reed)
        }
        try? moc.save()
    }
}

struct ReedBoxDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReedBoxDetail(reedBox: ReedBox())
    }
}
