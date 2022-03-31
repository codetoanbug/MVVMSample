//
//  PageObjectable.swift
//  TableviewSampleUITests
//
//  Created by Phương Thảo Nguyễn on 2022/03/31.
//

import Foundation
import XCTest

protocol PageObjectable: AnyObject {
    associatedtype A11y
    var app: XCUIApplication { get }
    var view: XCUIElement { get }
    var exists: Bool { get }
    func elementsExist(_ elements: [XCUIElement], timeout: Double) -> Bool
}

extension PageObjectable {

    var app: XCUIApplication {
        return XCUIApplication()
    }

    var view: XCUIElement {
        return app.windows.firstMatch
    }

    var exists: Bool {
        return elementsExist([view], timeout: 10)
    }

    func elementsExist(_ elements: [XCUIElement], timeout: Double) -> Bool {
        for element in elements {
            if !element.waitForExistence(timeout: timeout) {
                return false
            }
        }
        return true
    }
}

