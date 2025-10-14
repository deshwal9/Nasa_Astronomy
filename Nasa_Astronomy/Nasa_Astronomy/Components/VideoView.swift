//
//  VideoView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 05/10/2025.
//

import SwiftUI
import AVKit
import WebKit


struct VideoViewNew: UIViewRepresentable {
    let videoURL: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let htmlString = """
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>body { margin: 0; padding: 0; background-color: black; }</style>
        </head>
        <body>
            <video width="100%" height="100%" controls autoplay playsinline>
                <source src="\(videoURL.absoluteString)" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </body>
        </html>
        """
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}
