//
//  ReedBoxDetail.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/15/22.
//

import SwiftUI

struct ReedBoxDetail: View {
    @ObservedObject var vm: ReedListViewModel
    @ObservedObject var reedBox: ReedBox
    @ObservedObject var reedBoxVM: ReedBoxListViewModel
    @State var showingAlert: Bool = false
    
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
                    NavigationLink(destination: ReedDetailGroup(vm: EditReedViewModel(context: vm.context, reedBoxes: ReedBoxListViewModel(context: vm.context), reedToEdit: reed), reed: reed)){
                        ReedRow(reed: reed)
                    }
                }
                .onDelete(perform: deleteReed)
            }
            .navigationTitle(reedBox.name ?? "Unknown")
            .toolbar {
                EditButton()
            }
            NavigationLink("Add Reed", destination: AddReedGroup(vm: AddReedViewModel(context: vm.context, reedBoxes: ReedBoxListViewModel(context: vm.context))))
            .buttonStyle(BorderedButtonStyle.bordered)
        }
    }
    
    func deleteReed(at offsets:IndexSet){
        for offset in offsets{
            let reed = vm.reeds[offset]
            vm.deleteReed(reedID: reed.objectID)
        }
    }
}

struct ReedBoxDetail_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        ReedBoxDetail(vm: ReedListViewModel(context: viewContext), reedBox: ReedBox(), reedBoxVM: ReedBoxListViewModel(context: viewContext))
    }
}
