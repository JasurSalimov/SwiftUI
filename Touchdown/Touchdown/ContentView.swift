//
//  ContentView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/27/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    //MARK: - Body
    var body: some View {
            FooterView()
                .padding(.horizontal)
    }
}

//MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
