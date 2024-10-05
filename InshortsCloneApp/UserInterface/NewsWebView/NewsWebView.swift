//
//  NewsWebView.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 08/09/24.
//

import SwiftUI
import WebKit

struct NewsDetailWebView: View {
    let url: URL?
    var navigateToArticlesList: () -> ()

    var body: some View {
        NavigationStack {
            NewsWebView(url: url)
                .navigationBarTitle(AppNavigationTitles.newsArticle, displayMode: .inline)
            .background(Color.white)
            .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            .padding(.top, 44)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {

                    Button {
                        navigateToArticlesList()
                    } label: {
                        HStack {
                            Image(systemName: AppIcons.backIconName)
                            Text(AppNavigationTitles.topStories)
                        }
                        .padding(.leading, 8)
                    }
                }
            }
        }
    }
}

struct NewsWebView: UIViewRepresentable {
    let url: URL?

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = url {
            uiView.load(URLRequest(url: url))
        }
    }
}
