//
//  CreditsView.swift
//  Africa
//
//  Created by Jasur Salimov on 7/27/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack{
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width:128.0, height:128.0)
            Text("""
    Copyright © Jasur Salimov
    All rights reserved
    """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
