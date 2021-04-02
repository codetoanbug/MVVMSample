//
//  GithubSearchService.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Foundation

class GithubSearchService: BaseService {
    func searchRepositories(q: String, sort: String, order: String, completion: @escaping (Result<GithubSearchResponse, BaseError>) -> Void) {
        provider.request(MultiTarget(GithubAPI.searchRepositories(q: q, sort: sort, order: order)), type: GithubSearchResponse.self) { result in
            completion(result)
        }
    }
}
