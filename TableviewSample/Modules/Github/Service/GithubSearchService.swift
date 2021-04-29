//
//  GithubSearchService.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Foundation

class GithubSearchService: BaseService {
    func searchRepositories(language: String, sort: String, order: String, page: Int, completion: @escaping (Result<GithubSearchResponse, BaseError>) -> Void) {
        provider.request(MultiTarget(GithubAPI.searchRepositories(q: language, sort: sort, order: order, page: page)), type: GithubSearchResponse.self) { result in
            completion(result)
        }
    }
}
