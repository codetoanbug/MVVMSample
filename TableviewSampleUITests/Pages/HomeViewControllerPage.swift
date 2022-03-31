//
//  HomeViewControllerPage.swift
//  TableviewSampleUITests
//
//  Created by Phương Thảo Nguyễn on 2022/03/31.
//

import XCTest

final class HomeViewControllerPage: PageObjectable {
    enum A11y {
    }
    
    var exists: Bool {
        return elementsExist([view], timeout: 30)
    }
    
    var view: XCUIElement {
        return app.otherElements[Common.HomeViewControllerId].firstMatch
    }
    
    var localButton: XCUIElement {
        return view.buttons[Common.localButtonId].firstMatch
    }
    
    var githubButton: XCUIElement {
        return view.buttons[Common.githubButtonId].firstMatch
    }
    
}
