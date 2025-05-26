//
//  WebView.swift
//  RocketsX
//
//  Created by Алексей Орловский on 26.05.2025.
//

import SwiftUI
import WebKit

private typealias Module = LaunchesModule
private typealias CurrentView = Module.WebView

extension Module {
    struct WebView: UIViewRepresentable {
        let url: URL
        
        func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }
        
        func updateUIView(_ uiView: WKWebView, context: Context) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
