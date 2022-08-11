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
        do{
            // 1. Convert the notes array to data using JSONEncoder
            let data  = try JSONEncoder().encode(notes)
            
            // 2. Create a new URL to save the file using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            // 3. Write the data to the given url
            try data.write(to: url)
        }catch{
            print("Saving data has failed")
        }
    }
    func load(){
        DispatchQueue.main.async {
            do{
                // 1. get notes url path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // 2. create a new property for the data
                let data = try Data(contentsOf: url)
                // 3. Decode the data
                let decoded = try JSONDecoder().decode([Note].self, from: data)
                notes = decoded
            }catch{
                // do nothing
            }
        }
    }
    func delete(offsets: IndexSet){
        withAnimation{
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    func getDocumentDirectory() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    //MARK: - Body
    var body: some View {
        NavigationView{
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
                if !notes.isEmpty{
                    List{
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)){
                                HStack{
                                   Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                }// Hstack
                            }
                        }//For each
                        .onDelete(perform: delete)
                    }//List
                }else{
                    Spacer()
                    Image(systemName:"note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            }//: Vstack
            .onAppear(){
               load()
            }
        }
        .navigationTitle("Notes")
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
