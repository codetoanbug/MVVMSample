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
    private var suc: Succulent!
    
    override func setUp() {
        super.setUp()
        
        if let traceUrl = self.traceUrl {
            print("traceUrl = \(traceUrl)")
            // Replay using an existing trace file
            self.suc = Succulent(replayFrom: traceUrl)
        } else {
            print("self.recordUrl = \(self.recordUrl)")
            // Record to a new trace file
            // The "/" at the end of the base URL is required
            self.suc = Succulent(recordTo: self.recordUrl, baseUrl: URL(string: baseUrl)!)
        }
        
        suc.start()
        baseURL = URL(string: "http://localhost:\(suc.actualPort)")
        app.launch()
    }
    
    override func tearDown() {
        suc.stop()        
        super.tearDown()
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
