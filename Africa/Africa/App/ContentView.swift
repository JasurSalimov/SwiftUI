//
//  ContentView.swift
//  Africa
//
//  Created by Jasur Salimov on 7/18/22.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    
    var body: some View {
        NavigationView{
            List{
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)){
                        AnimalListItemView(animal: animal)
                    }// Link
                }// For each
            }//: Lists
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        // List
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary :.accentColor)
                        }//button
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }//button
                    }//:HStack
                }//Item
            }//Bar
        }// Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
