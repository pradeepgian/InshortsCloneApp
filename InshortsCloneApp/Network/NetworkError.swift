//
//  NetworkError.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 15/09/24.
//

import Foundation

public enum NetworkError: Error, Identifiable {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    public var id: String {
        switch self {
        case .invalidURL:
            return "InvalidURL"
        case .invalidResponse:
            return "InvalidResponse"
        case .statusCode(let statusCode):
            return "StatusCode\(statusCode)"
        }
    }
}
