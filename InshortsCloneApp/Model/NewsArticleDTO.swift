//
//  NewsArticleDTO.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 08/09/24.
//

import Foundation

struct NewsArticleDTO: Codable {
    let title: String
    let abstract: String
    let url: String
    let multimedia: [MultimediaDTO]?
}

struct MultimediaDTO: Codable {
    let url: String
}

struct NYTimesAPIResponse: Codable {
    let results: [NewsArticleDTO]
}

