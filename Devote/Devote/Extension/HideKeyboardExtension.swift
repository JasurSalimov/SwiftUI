//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Jasur Salimov on 8/10/22.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

