//
//  Note.swift
//  Notes Watch App
//
//  Created by Jasur Salimov on 8/10/22.
//

import Foundation

struct Note: Identifiable, Codable{
    let id: UUID
    let text: String
}
