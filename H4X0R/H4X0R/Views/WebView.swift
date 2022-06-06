//
//  WebView.swift
//  H4X0R
//
//  Created by Jasur Salimov on 6/6/22.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    let url: String?
    let request: URLRequest? = nil
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let string = url{
            if let URL = URL(string: string){
                uiView.load(URLRequest(url: URL))
            }
        }
    }
    
}
