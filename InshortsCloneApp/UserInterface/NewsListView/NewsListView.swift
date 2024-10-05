//
//  NewsListView.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 08/09/24.
//

import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel: NewsViewModel
    @Binding var currentArticleIndex: Int?

    var body: some View {
        NavigationStack {
            ZStack {
                switch viewModel.screenState {
                case .loading:
                    ProgressView(AppMessages.loadingMessage)
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)

                case .error(let error):
                    VStack(spacing: 12) {
                        Image(systemName: AppIcons.errorIconName)
                            .font(.system(size: 64, weight: .semibold))
                            .foregroundColor(.red)
                        Text("Failed to load news: \(error.localizedDescription)")
                    }

                case .complete:
                    GeometryReader { proxy in
                        let screenWidth = proxy.size.width
                        ScrollView {
                            LazyVStack(spacing: 0) {
                                ForEach(viewModel.articles.indices, id: \.self) { index in
                                    NewsCardView(article: viewModel.articles[index], imageWidth: screenWidth)
                                        .id(index)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollIndicators(.hidden)
                        .scrollTargetBehavior(.paging)
                        .ignoresSafeArea(edges: .bottom)
                        .padding(.top, 44)
                        .scrollPosition(id: $currentArticleIndex)
                        .onChange(of: currentArticleIndex) { oldValue, newValue in
                            print(newValue ?? "")
                        }
                    }

                case .idle:
                    EmptyView()
                }
            }
            .navigationTitle(AppNavigationTitles.topStories)
            .background(Color.white)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

