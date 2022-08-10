//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Jasur Salimov on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
//    @AppStorage("notes") private var notes: [Note] = [Note]()
    //MARK: - Functions
    func save(){
        dump(notes)
    }
    //MARK: - Body
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6, content: {
                TextField("Add new note", text: $text)
                Button{
                    // 1 only run the buttons action when the text fiels is not empty
                    if text.isEmpty{return}
                   //2. Create a new note item and init it with the text value
                    let note = Note(id: UUID(), text: text)
                    // 3. Add the new note item to the notes aarray
                    notes.append(note)
                    // 4. Make the text field empty
                    text.removeAll()
                    // 5. Save the notes (function)
                    save()
                }label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundColor(.accentColor)
//                .buttonStyle(BorderedButtonStyle(tint: .accentColor))
            })//:Hstack
            Spacer()
            
            Text("\(notes.count)")
        }//: Vstack
        .navigationTitle("Notes")
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
