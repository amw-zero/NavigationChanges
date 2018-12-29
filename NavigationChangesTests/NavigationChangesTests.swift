//
//  NavigationChangesTests.swift
//  NavigationChangesTests
//
//  Created by Alex on 12/27/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import XCTest
import UIKit
@testable import NavigationChanges

class MockOrderedNavigator: OrderedNavigation {
    var nextReceived = false
    func next() {
        nextReceived = true
    }
}

class NavigationChangesTests: XCTestCase {
    func testNavigatingToLocationSelection() {
        let navigator = MockOrderedNavigator()
        let selectItemVC = SelectItemVC()
        selectItemVC.navigator = navigator
        selectItemVC.onItemSelected()
        XCTAssert(navigator.nextReceived)
    }
    func testNavigatingToConfirmation() {
        let navigator = MockOrderedNavigator()
        let selectLocationVC = SelectLocationVC()
        selectLocationVC.navigator = navigator
        selectLocationVC.onLocationSelected()
        XCTAssert(navigator.nextReceived)
    }
}
