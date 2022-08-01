//
//  Constant.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/27/22.
//

import Foundation
import SwiftUI

// Data
let players:[Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")
let sampleProduct: Product = products[2]
//Color
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

//Layout
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem]{
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
//Ux
let feedback = UIImpactFeedbackGenerator(style: .medium)
//Api
//Image
//Font
//String
//Misc
