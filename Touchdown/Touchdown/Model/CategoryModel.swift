//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/28/22.
//

import Foundation

struct Category:Codable, Identifiable{
    let id: Int
    let name: String
    let image: String
}
