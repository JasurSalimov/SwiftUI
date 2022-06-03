//
//  ContentView.swift
//  BusinessCardApp
//
//  Created by Jasur Salimov on 6/3/22.
//

import SwiftUI
import Foundation
import UIKit
struct ContentView: View {
    private var screenWidth: CGFloat{
        return UIScreen.main.bounds.width
    }
    private var screenHeight: CGFloat{
        return UIScreen.main.bounds.height
    }
    var body: some View {
        ZStack{
            Color(red: 47/255, green: 143/255, blue: 157/255, opacity: 1)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("Jasur")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0, alignment: .center)
                    .cornerRadius(75)
                    .overlay(alignment: .center, content: {
                        Circle().stroke(Color.white, lineWidth: 4)
                    })
                Text("Jasur Salimov")
                    .font(.title)
                    .bold()
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .foregroundColor(.white)
                Text("iOS Developer @Neotech")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Divider()
                InfoView(phone: "+998 (90) 927-04-05",image: "phone.fill", rawPhone:"998909270405")
            }
        }
        .frame(width: screenWidth, height: screenHeight, alignment: .center)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InfoView: View {
    let phone: String
    let image: String
    let rawPhone: String
    private var screenWidth: CGFloat{
        return UIScreen.main.bounds.width
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(.white)
            .frame(width: screenWidth - 20, height: 40)
            .overlay(alignment: .center, content: {
                ZStack{
                    HStack{
                        Image(systemName: image)
                            .foregroundColor(.green)
                        Text(phone)
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .foregroundColor(.black)
                            .onTapGesture {
                                makeCall()
                            }
                    }
                }
            })
    }
    
    private func makeCall(){
        let telephone = "tel:\(rawPhone)"
        let formattedString = telephone
        guard let url = URL(string: formattedString) else { return }
        UIApplication.shared.open(url)
    }
}
