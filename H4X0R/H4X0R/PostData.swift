//
//  PostData.swift
//  H4X0R
//
//  Created by Jasur Salimov on 6/6/22.
//

import Foundation
struct JsonResult: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String{
        return objectID
    }
    let title: String
    let url: String?
    let objectID: String
    let points: Int
}
