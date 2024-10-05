//
//  TopStoriesEndPoint.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 14/09/24.
//

import Foundation

struct TopStoriesEndPoint: EndPoint {
    let scheme: String = "https"
    let host: String = "api.nytimes.com"
    let path: String = "/svc/topstories/v2/home.json"
    let httpMethod: HTTPMethod = .get
    let parameters: [String: String]

    init(apiKey: String) {
        self.parameters = ["api-key": apiKey]
    }
}
