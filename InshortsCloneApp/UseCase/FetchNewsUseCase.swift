//
//  FetchNewsUseCase.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 08/09/24.
//

import Foundation
import Combine

protocol FetchNewsUseCase {
    func execute() -> AnyPublisher<[NewsArticle], Error>
}

class FetchTopStoriesUseCase: FetchNewsUseCase {
    private let repository: NewsRepository

    init(repository: NewsRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[NewsArticle], Error> {
        return repository.fetchTopNewsStories()
    }
}

