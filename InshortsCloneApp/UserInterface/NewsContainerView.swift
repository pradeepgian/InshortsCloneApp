//
//  NewsContainerView.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 14/09/24.
//

import SwiftUI

struct NewsContainerView: View {
    @StateObject var viewModel: NewsViewModel
    @State private var currentArticleIndex: Int? = nil
    @State private var selectedTab: Int = 0

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                NewsListView(viewModel: viewModel, currentArticleIndex: $currentArticleIndex).tag(0)

                NewsDetailWebView(url: viewModel.articles.count > 0 ? viewModel.articles[currentArticleIndex ?? 0].url : nil) {
                    self.selectedTab = 0
                }.tag(1)
            }
            .animation(.easeInOut(duration: 0.5), value: selectedTab)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                viewModel.loadTopStories()
            }
        }
    }
}
