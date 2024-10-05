//
//  NewsRepository.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 08/09/24.
//

import Foundation
import Combine

protocol NewsRepository {
    func fetchTopNewsStories() -> AnyPublisher<[NewsArticle], Error>
}

class NewsArticlesRepository: NewsRepository {
    private let apiClient: NewsAPIClient

    init(apiClient: NewsAPIClient) {
        self.apiClient = apiClient
    }

    func fetchTopNewsStories() -> AnyPublisher<[NewsArticle], Error> {
        return apiClient.fetchTopNewsStories()
               .map { (response: NYTimesAPIResponse) in
                   response.results.map { dto in
                       NewsArticle(
                           title: dto.title,
                           summary: dto.abstract,
                           imageUrl: URL(string: dto.multimedia?.first?.url ?? ""),
                           content: nil,
                           url: URL(string: dto.url)!
                       )
                   }
               }
               .eraseToAnyPublisher()
    }
}
