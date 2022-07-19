//
//  LocationModel.swift
//  Africa
//
//  Created by Jasur Salimov on 7/19/22.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable{
    let id:String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D{
       return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
