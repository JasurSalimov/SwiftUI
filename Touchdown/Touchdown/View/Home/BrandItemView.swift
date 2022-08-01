//
//  BrandItemView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/28/22.
//

import SwiftUI

struct BrandItemView: View {
    let brand: Brand
    var body: some View {
            Image(brand.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .padding(3)
                .background(Color.white.cornerRadius(12))
                .background(
                    RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1))
    }
}

struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(brand: brands[1])
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
            .padding()
    }
}
