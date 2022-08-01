//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Jasur Salimov on 7/27/22.
//

import SwiftUI

@main
struct TouchdownApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
