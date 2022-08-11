//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Jasur Salimov on 8/11/22.
//

import SwiftUI

struct DetailView: View {
    //MARK: - Properties
    
    let note: Note
    let count: Int
    let index: Int
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 3){
            // Header
            HStack{
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
            // Content
            Spacer()
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            // Footer
            HStack(alignment: .center){
                Image(systemName: "gear")
                    .imageScale(.large)
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }// HStack
            .foregroundColor(.secondary)
            
        }// VStack
        .padding(3)
    }
}
//MARK: - Preview
struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "Hello, World")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
