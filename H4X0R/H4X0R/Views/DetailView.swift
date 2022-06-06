//
//  DetailView.swift
//  H4X0R
//
//  Created by Jasur Salimov on 6/6/22.
//

import SwiftUI
import WebKit
struct DetailView: View {
    let url: String?
    let title: String
    var body: some View {
        WebView(url: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com", title: "Detail View")
    }
}



