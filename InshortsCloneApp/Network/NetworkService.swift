//
//  NetworkService.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 08/09/24.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func performNetworkCall<T: Decodable>(for endpoint: EndPoint) -> AnyPublisher<T, Error>
}

class NetworkService: NetworkServiceProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func performNetworkCall<T: Decodable>(for endpoint: EndPoint) -> AnyPublisher<T, Error> {
        
        guard let url = endpoint.url else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                
                guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                    throw NetworkError.statusCode(httpResponse.statusCode)
                }
                
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}


