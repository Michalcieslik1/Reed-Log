//
//  NoteRow.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/24/22.
//

import SwiftUI

struct NoteRow: View {
    @ObservedObject var reed: Reed
    var body: some View {
        List{
            ForEach(reed.notesSet){ note in
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

        }
    }
}

struct NoteRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = DataController.shared.container.viewContext
        NoteRow(reed: Reed(context: viewContext))
    }
}
