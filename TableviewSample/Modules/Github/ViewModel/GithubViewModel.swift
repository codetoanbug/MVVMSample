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
    var needSetStateBottomIndicatorView: ((_ show: Bool) -> Void)?

    private var page: Int = 0
    private var language = ""
    private var incompleteResults = false
    
    // Datasource
    private var githubSearchItem: [GithubSearchItem] = []

    init() {
        // Turn on is test is true if you need test for API
        self.service = GithubSearchService(isTest: false)
    }

    /// Clear tableview data source
    func clearTableView() {
        self.page = 0
        self.incompleteResults = false
        self.githubSearchItem.removeAll()
        self.needReloadTableView?()
    }

    /// Request repositories
    func requestRepositories(language: String, loadMore: Bool = false) {
        self.language = language
        // Check when load more
        if self.incompleteResults {
            return
        }

        // Check data in local
        let keyword = language + String(self.page)
        if let oldResonse = RealmGithubService.shared.getRepositoryResponse(with: keyword) {
            self.incompleteResults = oldResonse.incompleteResults
            print("from local")
            let items = oldResonse.items
            items.forEach({ item in
                githubSearchItem.append(item)
            })

            if self.githubSearchItem.count > 0 {
                // Check when load more
                self.page += 1
                self.needSetStateBottomIndicatorView?(false)
                self.needReloadTableView?()
                return
            }
        }

        if !loadMore {
            self.page = 0
            self.githubSearchItem.removeAll()
        }

        // Default param
        let sort = "stars"
        let order = "desc"

        self.service.searchRepositories(language: language, sort: sort, order: order, page: self.page) { [weak self] result in
            guard let strongSelf = self else { return }
            // Check when load more
            if loadMore {
                strongSelf.needSetStateBottomIndicatorView?(false)
            }

            switch result {
            case .success(let githubResponse):
                // Save data to realm
                let keyword = language + String(strongSelf.page)
                _ = RealmGithubService.shared.saveRepositoryResponse(with: keyword, repoList: githubResponse)
                strongSelf.incompleteResults = githubResponse.incompleteResults
                let items = githubResponse.items
                items.forEach( {strongSelf.githubSearchItem.append( $0 )})
                print("from network")
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
        // Check if the last row number is the same as the last current data element
            if indexPath.row == self.githubSearchItem.count - 1 {
                self.needSetStateBottomIndicatorView?(true)
                self.page += 1
                self.requestRepositories(language: language, loadMore: true)
            }

        return githubSearchItem[indexPath.row]
    }
}
