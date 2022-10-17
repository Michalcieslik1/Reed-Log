//
//  AddNote.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/17/22.
//

import SwiftUI

struct AddNote: View {
    var vm: NoteListViewModel
    var body: some View {
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
        //.onDelete(perform: deleteNote)
        //TextEditor(text: $vm.tempNote)
        HStack{
            Spacer()
            Button("Add Note"){
                //addNote()
            }
            Spacer()
        }
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        AddNote(vm: NoteListViewModel(context: viewContext))
    }
}
