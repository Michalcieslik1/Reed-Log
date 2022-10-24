//
//  AddNote.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/17/22.
//

import SwiftUI

struct AddNote: View {
    @ObservedObject var vm: AddNoteViewModel
    @State var message: String = ""
    var body: some View {
        List{
            TextEditor(text: $message)
            HStack{
                Spacer()
                Button("Add Note"){
                    addNote()
                }
                Spacer()
            }
            ForEach(vm.notes){ note in
                VStack{
                    HStack{
                        Text(Reed.dateToString(date: note.date))
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    HStack{
                        Text(note.message ?? "")
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
            }
            .onDelete(perform: deleteNote)
        }
    }
    
    func deleteNote(at offsets: IndexSet){
        for i in offsets{
            vm.deleteNote(noteID: vm.notes[i].objectID)
        }
    }
    
    func addNote(){
        vm.addNote(message: message)
        message = ""
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        let viewModel = AddNoteViewModel(context: viewContext, test: true)
        AddNote(vm: viewModel)
    }
}
