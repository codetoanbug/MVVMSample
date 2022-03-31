//
//  HomeViewControllerUITest.swift
//  TableviewSampleUITests
//
//  Created by Phương Thảo Nguyễn on 2022/03/31.
//

import XCTest
@testable import Succulent

class HomeViewControllerUITest: XCTestCase, BaseViewControllerUITest {
    var baseURL: URL!
    
    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    func testOpenLocalView() throws {
        try XCTContext.runActivity(named: "Open local view") { (activity) in
            let homePage = HomeViewControllerPage()
            XCTAssert(homePage.exists, "Exit home page")
            homePage.localButton.tap()
        }
    }
    
    func testOpenGithubView() throws {
        try XCTContext.runActivity(named: "Open github view") { (activity) in
            let homePage = HomeViewControllerPage()
            homePage.githubButton.tap()
        }
    }
}
