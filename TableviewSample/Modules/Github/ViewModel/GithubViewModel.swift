//
//  GithubViewModel.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Foundation

class GithubViewModel {
    // Service call API
    let service: GithubSearchService!
    // Callback to view
    var needReloadTableView: (() -> Void)?
    var needShowError: ((BaseError) -> Void)?

    // Datasource
    private var githubSearchItem: [GithubSearchItem] = []

    init() {
        // Turn on is test is true if you need test for API
        self.service = GithubSearchService(isTest: false)
    }

    /// Request repositories
    func requestRepositories() {
        // Demo param
        let q = "language:swift"
        let sort = "stars"
        let order = "desc"

        self.service.searchRepositories(q: q, sort: sort, order: order) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let githubResponse):
                strongSelf.githubSearchItem = githubResponse.items ?? []
                strongSelf.needReloadTableView?()
            case .failure(let error):
                strongSelf.needShowError?(error)
            }
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return githubSearchItem.count
    }

    func cellForRowAt(indexPath: IndexPath) -> GithubSearchItem {
        return githubSearchItem[indexPath.row]
    }
}
