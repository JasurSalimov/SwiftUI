//
//  CenterModifier.swift
//  Africa
//
//  Created by Jasur Salimov on 7/27/22.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}


