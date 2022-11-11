//
//  DataCollection.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/11/22.
//

import SwiftUI

struct DataCollection: View {
    @ObservedObject var vm: DataCollectionVM
    @ObservedObject var rlvm: ReedListViewModel
    
    var body: some View {
        List{
            Section(header: Text("Save Data")){
                Text("Save Files")
                ForEach(vm.saveFiles){ saveFile in
                    Text("Date")
                }
            }
            Button(action: {
                save()
            }, label: {
                Text("Save")
                    .centerHorizontally()
            })
        }
        .navigationTitle("Data Collection")
    }
    
    func save(){
        vm.save(reeds: rlvm)
    }
}

struct DataCollection_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        DataCollection(vm: DataCollectionVM(context: viewContext), rlvm: ReedListViewModel(context:viewContext))
    }
}
