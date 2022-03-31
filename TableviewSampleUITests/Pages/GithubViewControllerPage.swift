//
//  GithubViewControllerPage.swift
//  TableviewSampleUITests
//
//  Created by Phương Thảo Nguyễn on 2022/03/31.
//

import XCTest

final class GithubViewControllerPage: PageObjectable {
    enum A11y {
    }
    
    var exists: Bool {
        return elementsExist([view], timeout: 30)
    }
    
    var view: XCUIElement {
        return app.otherElements[Common.GithubViewControllerId].firstMatch
    }
    
    var searchTextFied: XCUIElement {
        return view.textFields[Common.githubSearchTextViewId].firstMatch
    }
    
    var githubTableView: XCUIElement {
        return app.otherElements[Common.githubTableViewId].firstMatch
    }
}
