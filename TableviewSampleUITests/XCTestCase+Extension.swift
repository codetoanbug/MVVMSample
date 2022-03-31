//
//  XCTestCase+Extension.swift
//  TableviewSampleUITests
//
//  Created by Phương Thảo Nguyễn on 2022/03/31.
//

import XCTest
import Foundation

extension XCTest {

  func waiting(duration: TimeInterval) {
    let exp = XCTestExpectation(description: "Test after \(duration) seconds")
     let result = XCTWaiter.wait(for: [exp], timeout: duration)
     if result == XCTWaiter.Result.timedOut {
         XCTAssert(true)
     } else {
         XCTFail("Delay interrupted")
     }
  }
}

extension XCUIElement {
    
    func clearText() {
        
        //
        // cf. and tip courtesy of
        //    https://stackoverflow.com/questions/32821880/ui-test-deleting-text-in-text-field
        //
        guard let stringValue = self.value as? String else {
            return
        }
        // workaround for apple bug
        if let placeholderString = self.placeholderValue, placeholderString == stringValue {
            return
        }
        
        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        self.typeText(deleteString)
    }
    
    func typeTextAndPressEnter(_ text: String) {
        self.typeText("\(text)\n")
    }

}

