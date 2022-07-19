//
//  InsetFactView.swift
//  Africa
//
//  Created by Jasur Salimov on 7/19/22.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - Properties
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact, id: \.self){item in
                    Text(item)
                }
            }// Tab
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }// Group
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
