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
    
    func doc(a: String) -> TransferableDocument
    {
        return TransferableDocument(initialText: a)
    }
    
    var body: some View {
        Section(header: Text("Save Data")){
                ForEach(vm.saveFiles){ saveFile in
                    HStack{
                        Text(saveFile.date?.formatted() ?? "")
                        Spacer()
                        if #available(iOS 16.0, *) {
                            ShareLink(item: doc(a: saveFile.data ?? "No Data") ,preview: SharePreview("logfile"))
                            {
                                Text("Share")
                            }
                        } else {
                            Text("Error")
                        }
                    }
                }.onDelete(perform: deleteData)
            }
            Button("Save"){
                save()
            }
            .buttonStyle(.borderedProminent).centerHorizontally()
        
        //.navigationTitle("Data Collection")
    }
    
    func save(){
        vm.save(reeds: rlvm)
    }
    func deleteData(at offsets:IndexSet){
        for offset in offsets{
            let json = vm.saveFiles[offset]
            vm.deleteData(dataID: json.objectID)
        }
    }
}

struct DataCollection_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        DataCollection(vm: DataCollectionVM(context: viewContext), rlvm: ReedListViewModel(context:viewContext))
    }
}
