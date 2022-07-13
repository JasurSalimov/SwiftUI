//
//  ContentView.swift
//  Restart
//
//  Created by Jasur Salimov on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    // This is swiftui's userDefaults under the hood
    var body: some View {
        ZStack{
            if(isOnboardingViewActive){
                OnboardingView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
