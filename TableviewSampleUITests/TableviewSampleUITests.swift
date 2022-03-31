//
//  TableviewSampleUITests.swift
//  TableviewSampleUITests
//
//  Created by Phương Thảo Nguyễn on 2022/03/31.
//

import XCTest
import Succulent

let baseUrl = "https://api.github.com/"

class TableviewSampleUITests: XCTestCase {
    var app: XCUIApplication!
    var succulent: Succulent!
    
    override func setUp() {
        super.setUp()
        
        self.app = XCUIApplication()
        
        if let traceUrl = self.traceUrl {
            print("traceUrl = \(traceUrl)")
            // Replay using an existing trace file
            self.succulent = Succulent(replayFrom: traceUrl)
        } else {
            print("self.recordUrl = \(self.recordUrl)")
            // Record to a new trace file
            // The "/" at the end of the base URL is required
            self.succulent = Succulent(recordTo: self.recordUrl, baseUrl: URL(string: baseUrl)!)
        }
        
        self.succulent.start()
        
        self.app.launchEnvironment["succulentBaseURL"] = "http://localhost:\(succulent.actualPort)/"
        self.app.launch()
    }
    
    /// The name of the trace file for the current test
    private var traceName: String {
        return self.description.trimmingCharacters(in: CharacterSet(charactersIn: "-[] ")).replacingOccurrences(of: " ", with: "_")
    }
    
    /// The URL to the trace file for the current test when running tests
    private var traceUrl: URL? {
        let bundle = Bundle(for: type(of: self))
        return bundle.url(forResource: self.traceName, withExtension: "trace", subdirectory: "Succulent")
    }
    
    /// The URL to the trace file for the current test when recording
    private var recordUrl: URL {
        let bundle = Bundle(for: type(of: self))
        let recordPath = bundle.infoDictionary!["TraceRecordPath"] as! String
        return URL(fileURLWithPath: "\(recordPath)\(self.traceName).trace")
    }
    
    func testDemo() throws {
        let apiBaseUrlString = ProcessInfo.processInfo.environment["succulentBaseURL"] ?? baseUrl
        let apiBaseUrl = URL(string: apiBaseUrlString)
    }
}
