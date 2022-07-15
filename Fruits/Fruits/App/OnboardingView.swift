//
//  OnboardingView.swift
//  Fruits
//
//  Created by Jasur Salimov on 7/15/22.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
    var fruits: [Fruit] = fruitsData
    //MARK: - Body
    var body: some View {
        TabView{
            ForEach(fruits[0...5]){ item in
               FruitCardView(fruit: item)
            }
        } // :Tab
        .tabViewStyle(.page)
        .padding(.vertical, 20)
    }
}

//MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
