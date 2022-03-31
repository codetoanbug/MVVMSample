//
//  GithubViewControllerUITest.swift
//  TableviewSampleUITests
//
//  Created by Phương Thảo Nguyễn on 2022/03/31.
//

import XCTest
@testable import Succulent

class GithubViewControllerUITest: XCTestCase, BaseViewControllerUITest {
    var baseURL: URL!
   
    private var suc: Succulent!
    
    override func setUp() {
        super.setUp()
        
//        if let traceUrl = self.traceUrl {
//            print("traceUrl = \(traceUrl)")
//            // Replay using an existing trace file
//            self.suc = Succulent(replayFrom: traceUrl)
//        } else {
//            print("self.recordUrl = \(self.recordUrl)")
//            // Record to a new trace file
//            // The "/" at the end of the base URL is required
//            self.suc = Succulent(recordTo: self.recordUrl, baseUrl: baseURL)
//        }
        print("self.recordUrl = \(self.recordUrl)")
//        self.suc = Succulent(recordTo: self.recordUrl, baseUrl: baseURL)
        self.suc = Succulent(recordTo: recordUrl, baseUrl: URL(string: "https://api.github.com//")!)
        
        suc.start()
        baseURL = URL(string: "http://localhost:\(suc.actualPort)")
        
        app.launch()
    }
    
    override func tearDown() {
        suc.stop()
        super.tearDown()
    }
    
    func testSearchOnGithubView() {
         XCTContext.runActivity(named: "Search on Githubb View") { (activity) in
            let homePage = HomeViewControllerPage()
            homePage.githubButton.tap()
            let githubPage = GithubViewControllerPage()
            XCTAssert(githubPage.exists, "Exit github page")
            let searchTextField = githubPage.searchTextFied
            searchTextField.tap()
            waiting(duration: 1)
            searchTextField.typeText("swift")
            waiting(duration: 3)
//            githubPage.githubTableView
//            XCTAssertTrue(githubPage.githubTableView)
            
        }
    }

}

