//
//  ContentView.swift
//  Fruits
//
//  Created by Jasur Salimov on 7/15/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData
    var body: some View {
        NavigationView{
            List(fruits.shuffled()){ item in
                NavigationLink(destination: FruitDetailView(fruit: item), label: {
                    FruitRowView(fruit: item)
                        .padding(.vertical, 4)
                })
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
            }
                                                )
                .sheet(isPresented: $isShowingSettings, content: {
                    SettingsView()
                })
            )
        }//: Navigation
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
