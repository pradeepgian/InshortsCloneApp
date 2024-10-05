//
//  NewsAPIClient.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 15/09/24.
//

import Foundation
import Combine

class NewsAPIClient {
    private let networkService: NetworkServiceProtocol
    private let apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
        self.networkService = NetworkService()
    }
    
    func fetchTopNewsStories<T: Decodable>() -> AnyPublisher<T, Error> {
        let topStoriesEndpoint = TopStoriesEndPoint(apiKey: apiKey)
        return networkService.performNetworkCall(for: topStoriesEndpoint)
    }
    
}
