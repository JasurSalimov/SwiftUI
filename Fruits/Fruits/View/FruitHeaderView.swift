//
//  FruitHeaderView.swift
//  Fruits
//
//  Created by Jasur Salimov on 7/15/22.
//

import SwiftUI

struct FruitHeaderView: View {
    //MARK: - Properties
    var fruit: Fruit
    @State var isAnimating: Bool = false
    //MARK: - Body
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomLeading)
            Image(fruit.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
//                .frame(height:UIScreen.main.bounds.height/2)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y:8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimating ? 1.0 : 0.6)
        }//: Zstack
        .frame(height: 440)
        .onAppear(){
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
    }
}

//MARK: - Preview
struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
