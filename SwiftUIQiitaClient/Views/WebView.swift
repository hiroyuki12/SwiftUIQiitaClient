//
//  WebView.swift
//  SwiftUIQiitaClient
//
//  Created by 伊藤凌也 on 2019/06/07.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    }
    
    func updateUIView(_ view: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        view.load(request)
    }
}

#if DEBUG
struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "https://qiita.com")!)
    }
}
#endif
