//
//  Shop.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/29/22.
//

import Foundation

class Shop: ObservableObject{
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
