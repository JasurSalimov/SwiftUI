//
//  PageModel.swift
//  Pinch App
//
//  Created by Jasur Salimov on 7/13/22.
//

import Foundation

struct Page: Identifiable{
    let id: Int
    let imageName: String
}

extension Page{
    var thumbnailName: String{
        return "thumb-" + imageName
    }
}
