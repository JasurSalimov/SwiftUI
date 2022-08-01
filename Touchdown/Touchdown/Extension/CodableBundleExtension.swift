//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/28/22.
//

import Foundation

extension Bundle{
    
    func decode<T: Codable>(_ file: String) -> T{
        // Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else{fatalError("Failed to locate file in bundle")}
        // Create a property for the data
        guard let data = try? Data(contentsOf: url) else{ fatalError("Failed to load \(file) from bundle")}
        // Create a decoder
        let decoder = JSONDecoder()
        // Create a property for the decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else{ fatalError("Failed to decode \(file) fro, bundle.")}
        // Return ready data
        return decodedData
    }
}
