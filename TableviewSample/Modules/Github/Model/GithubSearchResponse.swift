//
//  GithubSearchResponse.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Foundation

// MARK: - GithubSearchResponse
struct GithubSearchResponse: Codable {
    let totalCount: Int?
    let incompleteResults: Bool
    let items: [GithubSearchItem]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct GithubSearchItem: Codable {
    let id: Int
    let name: String?
    let htmlURL: String?
    let itemDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case htmlURL = "html_url"
        case itemDescription = "description"
    }
}
