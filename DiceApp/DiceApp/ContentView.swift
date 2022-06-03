//
//  ContentView.swift
//  DiceApp
//
//  Created by Jasur Salimov on 6/3/22.
//

import SwiftUI

struct ContentView: View {
    @State var leftDiceNumber: Int = 1
    @State var rightDiceNumber: Int = 1
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image("diceeLogo")
                    Spacer()
                HStack{
                   DiceView(number: leftDiceNumber)
                   DiceView(number: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action:{
                rollPressed()
                }, label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                        .background(.red)
                })
                .frame(height:70)
            }
        }
    }
    private func rollPressed(){
        leftDiceNumber = Int.random(in: 1...6)
        rightDiceNumber = Int.random(in: 1...6)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    var number: Int
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding(25)
    }
}
