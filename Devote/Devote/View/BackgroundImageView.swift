//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Jasur Salimov on 8/10/22.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .resizable()
            .antialiased(true)
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
