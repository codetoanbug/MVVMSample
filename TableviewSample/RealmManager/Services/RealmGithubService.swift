//
//  RealmGithubService.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/05/05.
//

import Foundation

protocol RealmGithubServiceProtocol {
    func saveRepositoryResponse(repoList: GithubSearchResponse) -> Bool
    func getRepositoryResponse(with keyword: String) -> GithubSearchResponse?
    func deleteRepositoryResponse(with keyword: String) -> Bool
    func deleteAllRepositoryResppnses() -> Bool
}

class RealmGithubService: RealmManager<GithubSearchResponse>, RealmGithubServiceProtocol {
    /// Save repository response
    /// - Parameter repoList: repoList need save
    /// - Returns: success or failed
    func saveRepositoryResponse(repoList: GithubSearchResponse) -> Bool {
        return self.save(entity: repoList)
    }

    /// get repository response saved
    /// - Parameter keyword: keyword search
    /// - Returns: success or failed
    func getRepositoryResponse(with keyword: String) -> GithubSearchResponse? {
        let repositoryResponse = self.queryAll().filter({ $0.keyword == keyword}).first
        return repositoryResponse
    }

    /// Delete repository respnse
    /// - Parameter keyword: keyword search
    /// - Returns: success or failed
    func deleteRepositoryResponse(with keyword: String) -> Bool {
        if let repositoryResponse = self.getRepositoryResponse(with: keyword) {
            return self.delete(entity: repositoryResponse)
        }
        return false
    }

    /// Delete all repository response
    /// - Returns: success or failed
    func deleteAllRepositoryResppnses() -> Bool {
        return self.deleteAll()
    }

    // Make singleton class
    private override init() {}

    static let shared = RealmGithubService()
}

// Extend keyword to delete
extension GithubSearchResponse: RealmRepresentable {
    var uid: String {
        return keyword
    }
}
