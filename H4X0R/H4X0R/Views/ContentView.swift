//
//  ContentView.swift
//  H4X0R
//
//  Created by Jasur Salimov on 6/3/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(destination:DetailView(url: post.url, title: "Details"), label: {
                    HStack{
                        Text(String(post.points))
                            .padding(.trailing, 5)
                        Text(post.title)
                    }
                })
            }
            .navigationTitle("H4XOR NEWS")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


