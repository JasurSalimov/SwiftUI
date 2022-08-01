//
//  ProductGridView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/28/22.
//

import SwiftUI

struct ProductGridView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: gridLayout, spacing: 15){
                ForEach(products){ product in
                    ProductItemView(product: product)
                }// Loop
            }//Grid
            .padding(15)
        }
    }
}

struct ProductGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
