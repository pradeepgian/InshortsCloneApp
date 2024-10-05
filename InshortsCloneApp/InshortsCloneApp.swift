//
//  InshortsCloneApp.swift
//  InshortsCloneApp
//
//  Created by Pradeep Gianchandani on 15/09/24.
//

import SwiftUI

@main
struct InshortsCloneApp: App {
    var body: some Scene {
        WindowGroup {
            let apiClient = NewsAPIClient(apiKey: APIConstants.apiKey)
            let newsRepository = NewsArticlesRepository(apiClient: apiClient)
            let fetchNewsUseCase = FetchTopStoriesUseCase(repository: newsRepository)
            let viewModel = NewsViewModel(fetchNewsUseCase: fetchNewsUseCase)
            NewsContainerView(viewModel: viewModel)
        }
    }
}
