//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/28/22.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading,spacing: 6){
            ZStack{
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }//Zstack
            .background(
                Color(red: product.red, green: product.green, blue: product.blue)
                    .cornerRadius(20))
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            Text(product.formattedPrice)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: products[1])
            .previewLayout(.fixed(width: 200, height: 300))
            .background(colorBackground)
            .padding()
    }
}
