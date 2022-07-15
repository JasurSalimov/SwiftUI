//
//  ContentView.swift
//  Fruits
//
//  Created by Jasur Salimov on 7/15/22.
//

import SwiftUI

struct ContentView: View {
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
        }//: Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
