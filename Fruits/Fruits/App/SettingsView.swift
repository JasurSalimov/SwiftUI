//
//  SettingsView.swift
//  Fruits
//
//  Created by Jasur Salimov on 7/15/22.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - Body
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:20) {
                    Text("Hello, World!")
                }//: VStack
                .navigationTitle(Text("Settings"))
                .navigationBarTitleDisplayMode(.large)
                .padding()
            }//:Scroll
        }//:Nav
    }
}

//MARK: - Previews
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
