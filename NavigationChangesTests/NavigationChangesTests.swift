//
//  NavigationChangesTests.swift
//  NavigationChangesTests
//
//  Created by Alex on 12/27/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import XCTest
@testable import NavigationChanges

class NavigationChangesTests: XCTestCase {
    // SelectedItemVC
    func testSelectItemButtonClick() {
        var buttonClicked = false
        let selectItemVC = SelectItemVC {
            buttonClicked = true
        }
        selectItemVC.selectItem()
        XCTAssert(buttonClicked)
    }
    // Navigator
    // Better test in better-cohesion branch
//    func testNavigationExecution() {
//        let navigator = CheckoutCoordinator(views: [.selectItem, .selectLocation])
//        navigator.next()
//        XCTAssert(navigator.navigationController.topViewController is SelectLocationVC)
//    }
}
