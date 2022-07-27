//
//  CoverImageView.swift
//  Africa
//
//  Created by Jasur Salimov on 7/18/22.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    //MARK: - Body
    var body: some View{
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFit()
            }//: Loop
        }//: Tab
        .frame(width: UIScreen.main.bounds.width)
        .frame(height: 300)
        .tabViewStyle(.page)
    }
    
}
//MARK: - Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
