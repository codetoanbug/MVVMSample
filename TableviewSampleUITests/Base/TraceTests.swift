//
//  TraceTests.swift
//  TableviewSampleUITests
//
//  Created by Phương Thảo Nguyễn on 2022/03/31.
//

import XCTest

@testable import Succulent
import XCTest

class TraceTests: XCTestCase, SucculentTest {
    
    private var suc: Succulent!
    var session: URLSession!
    var baseURL: URL!
    private var recordingURL: URL!
    
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
//            self.suc = Succulent(recordTo: self.recordUrl, baseUrl: URL(string: baseUrl)!)
//        }
        
        recordingURL = self.recordUrl
        
        print("self.recordUrl = \(self.recordUrl)")
        suc = Succulent(recordTo: recordingURL, baseUrl: URL(string: "http://cactuslab.com/")!)
        
        suc.start()
        
        baseURL = URL(string: "http://localhost:\(suc.actualPort)")
        session = URLSession(configuration: .default)
    }
    
    // file:///Users/phuongthaonguyen/coding/ios/MVVMSample/Succulent//GithubViewControllerUITest_testSearchOnGithubView.trace
    // file:///Users/phuongthaonguyen/coding/ios/MVVMSample/Succulent//TraceTests_testRecordingResult.trace
    
    /// The URL to the trace file for the current test when running tests
    private var traceUrl: URL? {
        let bundle = Bundle(for: type(of: self))
        let recordPath = bundle.infoDictionary!["TraceRecordPath"] as! String
        return URL(fileURLWithPath: "\(recordPath)/\(self.traceName).trace")
    }
    
    /// The name of the trace file for the current test
    private var traceName: String {
        return self.description.trimmingCharacters(in: CharacterSet(charactersIn: "-[] ")).replacingOccurrences(of: " ", with: "_")
    }
    
    /// The URL to the trace file for the current test when recording
    private var recordUrl: URL {
        let bundle = Bundle(for: type(of: self))
        let recordPath = bundle.infoDictionary!["TraceRecordPath"] as! String
        return URL(fileURLWithPath: "\(recordPath)/\(self.traceName).trace")
    }
    
    override func tearDown() {
        suc.stop()
        
        super.tearDown()
    }
    
    func testRecordingSimple() {
        // NB: we've bundled a trace file for this test to demonstrate that existing traces are not used in recording mode
        GET("index.html") { (data, response, error) in
            XCTAssertEqual(response?.statusCode, 404)
            let string = String(data: data!, encoding: .utf8)!
            XCTAssertTrue(string.endIndex > string.startIndex)
        }
    }
    
    func testRecordingResult() {
        GET("/") { (data, response, error) in
            XCTAssertEqual(response?.statusCode, 200)
            
            let traceReader = TraceReader(fileURL: self.recordingURL)
            let results = traceReader.readFile()!
            
            XCTAssertEqual(results.count, 1)
            
            XCTAssert(results[0].responseBody == data)
        }
    }
    
}
