//
//  VideoModel.swift
//  Africa
//
//  Created by Jasur Salimov on 7/19/22.
//

import Foundation

struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    // computed property
    
    var thumbnail: String{
        return "video-\(id)"
    }
}

