//
//  FooterView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/27/22.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: .center){
            Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundColor(.gray)
            
            Text("Copyright © Jasur Salimov \n All right reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
        }//Vstack
        .padding()
        
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
            .padding()
    }
}
