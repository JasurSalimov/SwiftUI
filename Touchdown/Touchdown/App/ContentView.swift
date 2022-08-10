//
//  ContentView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/27/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    @EnvironmentObject var shop: Shop
    
    var screenWidth: CGFloat{
        return UIScreen.main.bounds.width
    }
    var screenHeight: CGFloat{
        return UIScreen.main.bounds.height
    }
    //MARK: - Body
    var body: some View {
        ZStack{
            if shop.showingProduct == false && shop.selectedProduct == nil{
                VStack(spacing: 0){
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x:0, y: 5)
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 0){
                            FeaturedTabView()
                                .padding(.vertical)
                                .frame(idealHeight: 240)
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            LazyVGrid(columns: gridLayout, spacing: 15){
                                ForEach(products){ product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            withAnimation(.easeOut){
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                }// Loop
                                
                            }//Grid
                            .padding(15)
                            
                            TitleView(title: "Brands")
                            BrandGridView()
                            FooterView()
                                .padding(.horizontal)
                        }// Vstack
                    }// ScrollView
                }// Vstack
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            }else{
                ProductDetailView()
                    .environmentObject(shop)
            }
        }// Zstack
        .ignoresSafeArea(.all, edges: .top)
    }
}

//MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
