//
//  NavigationChangesUITests.swift
//  NavigationChangesUITests
//
//  Created by Alex on 12/28/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import XCTest

extension XCUIApplication {
    var isDisplayingSelectLocationVC: Bool {
        return otherElements["selectLocationView"].exists
    }
    var isDisplayingConfirmationVC: Bool {
        return otherElements["confirmationView"].exists
    }
}

class NavigationChangesUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testCheckoutProcess() {
        app.buttons["selectItemButton"].tap()
        XCTAssert(app.isDisplayingSelectLocationVC)
        app.buttons["selectLocationButton"].tap()
        XCTAssert(app.isDisplayingConfirmationVC)
    }
}
