//
//  CustomHeader.swift
//  Devote
//
//  Created by Jasur Salimov on 8/10/22.
//

import SwiftUI

struct CustomHeader: View {
    var body: some View {
        HStack{
            Text("Devote")
            Spacer()
        }
        .padding()
    }
}

struct CustomHeader_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeader()
            .previewLayout(.sizeThatFits)
            
    }
}
