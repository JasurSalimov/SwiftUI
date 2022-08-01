//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/28/22.
//

import SwiftUI

struct NavigationBarDetailView: View {
    @EnvironmentObject var shop: Shop
    var body: some View {
        HStack{
            Button(action: {
                withAnimation(.easeIn){
                    shop.showingProduct = false
                    shop.selectedProduct = nil
                    feedback.impactOccurred()
                }
            }, label: {
               Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            })
        }
    }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
    
}
