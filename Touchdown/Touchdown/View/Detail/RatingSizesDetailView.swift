//
//  RatingSizesDetailView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/29/22.
//

import SwiftUI

struct RatingSizesDetailView: View {
    //MARK: - Properties
    let sizes: [String] = ["XS","S","M","L","XL"]
    
    var body: some View {
        HStack(alignment: .top, spacing: 3){
            // Ratings
            VStack(alignment: .leading, spacing: 3){
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                
                HStack(alignment: .center, spacing: 3, content: {
                    ForEach(1..<5, id: \.self){ each in
                        Button(action: {}, label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(colorGray.cornerRadius(5))
                                .foregroundColor(.white)
                        })
                    }
                })
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 3, content: {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                
                HStack(alignment: .center, spacing: 5){
                    ForEach(sizes, id: \.self){each in
                        Button(action: {}, label: {
                            Text(each)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(colorGray)
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.white.cornerRadius(5))
                                .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(colorGray,lineWidth: 2))
                        })
                    }
                }//Hstack
            })//Vstack
            //Sizes
        }// Hstack
    }
}

struct RatingSizesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingSizesDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
