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
        let selectItemVC = SelectItemVC(navigator: navigator)
        selectItemVC.navigateToSelectLocationViewController()
        XCTAssert(navigator.nextReceived)
    }
    func testNavigatingToConfirmation() {
        let navigator = MockOrderedNavigator()
        let selectLocationVC = SelectLocationVC(navigator: navigator)
        selectLocationVC.onLocationSelected()
        XCTAssert(navigator.nextReceived)
    }
}
