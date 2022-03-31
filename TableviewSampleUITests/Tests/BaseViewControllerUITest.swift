//
//  BaseViewControllerUITest.swift
//  TableviewSampleUITests
//
//  Created by Phương Thảo Nguyễn on 2022/03/31.
//

import Foundation
import XCTest

protocol BaseViewControllerUITest {
    var app: XCUIApplication! { get }
    var baseURL: URL! { get }
    var traceUrl: URL? { get }
    var traceName: String { get }
    var recordUrl: URL { get }
}

extension BaseViewControllerUITest where Self: XCTestCase {
    var app: XCUIApplication! {
        return XCUIApplication()
    }
    /// The URL to the trace file for the current test when running tests
     var traceUrl: URL? {
        let bundle = Bundle(for: type(of: self))
        let recordPath = bundle.infoDictionary!["TraceRecordPath"] as! String
        return URL(fileURLWithPath: "\(recordPath)/\(self.traceName).trace")
    }
    
    /// The name of the trace file for the current test
    var traceName: String {
        return self.description.trimmingCharacters(in: CharacterSet(charactersIn: "-[] ")).replacingOccurrences(of: " ", with: "_")
    }
    
    /// The URL to the trace file for the current test when recording
    var recordUrl: URL {
        let bundle = Bundle(for: type(of: self))
        let recordPath = bundle.infoDictionary!["TraceRecordPath"] as! String
        return URL(fileURLWithPath: "\(recordPath)/\(self.traceName).trace")
    }
}
