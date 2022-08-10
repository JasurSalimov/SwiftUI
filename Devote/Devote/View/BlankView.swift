//
//  BlankView.swift
//  Devote
//
//  Created by Jasur Salimov on 8/10/22.
//

import SwiftUI

struct BlankView: View {
    //MARK: - Property
    
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    //MARK: - Body
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: .zero, maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .edgesIgnoringSafeArea(.all)
        .blendMode(.overlay)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea(.all))
        
    }
}
