//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/29/22.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            // nav bar
            NavigationBarDetailView()
                .environmentObject(shop)
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            //header
            HeaderDetailView()
                .environmentObject(shop)
                .padding(.horizontal)
            //detail top Part
            TopPartDetailView()
                .environmentObject(shop)
                .padding(.horizontal)
                .zIndex(1)
            //deetail bottom Part
            VStack(alignment: .center, spacing: 0){
                // ratings + sizes
                RatingSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                ScrollView(.vertical, showsIndicators: false){
                    Text(shop.selectedProduct?.description ??  sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                //quantity + favourite
                QuantityFavouriteDetailView()
                    .padding(.vertical, 10)
                // add to cart
                AddToCartDetailView()
                    .padding(.bottom, 20)
                Spacer()
            }// Vstack
            .padding(.horizontal)
            .background(Color.white
                .clipShape(CustomShape())
                .padding(.top, -105))
        })// Vstack
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(
                red: shop.selectedProduct?.red ?? sampleProduct.red,
                green: shop.selectedProduct?.green ?? sampleProduct.green,
                blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
        )
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
    }
}
