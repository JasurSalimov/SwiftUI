//
//  QuantityFavouriteDetailView.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/29/22.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
    //MARK: - Property
    
    @State private var counter: Int = 0
    @State private var selected: Bool = false
    //MARK: - Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button(action: {
                feedback.impactOccurred()
                if counter > 0{
                    counter -= 1
                }
            }, label: {
                Image(systemName: "minus.circle")
            })
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)
            Button(action: {
                feedback.impactOccurred()
                if counter < 100{
                    counter += 1
                }
            }, label: {
                Image(systemName: "plus.circle")
            })
            Spacer()
            Button(action: {
                selected.toggle()
                feedback.impactOccurred()
            }, label: {
                Image(systemName: "heart.circle")
                    .foregroundColor(selected ? .red : .black)
                    
            })
        }// Hstack
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

struct QuantityFavouriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavouriteDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
