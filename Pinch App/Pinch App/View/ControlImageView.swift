//
//  ControlImageView.swift
//  Pinch App
//
//  Created by Jasur Salimov on 7/13/22.
//

import SwiftUI

struct ControlImageView: View {
    var icon: String
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "minus.magnifyingglass")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
    }
}
