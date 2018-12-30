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
    func testOrderedNavigationNextVC() {
        let initialVC = UIViewController()
        let secondVC = UIViewController()
        let navigationController = UINavigationController()
        let orderedNavigator = OrderedNavigator(
            navigationController: navigationController,
            viewControllers: [initialVC, secondVC])
        orderedNavigator.next()
        XCTAssertEqual(navigationController.topViewController, secondVC)
        XCTAssertEqual(orderedNavigator.currentVCIndex, 1)
    }
    func testOrderedNavigationPreviousVC() {
        let initialVC = UIViewController()
        let secondVC = UIViewController()
        let navigationController = UINavigationController()
        let orderedNavigator = OrderedNavigator(
            navigationController: navigationController,
            viewControllers: [initialVC, secondVC])
        orderedNavigator.next()
        orderedNavigator.back()
        XCTAssertEqual(navigationController.topViewController, initialVC)
        XCTAssertEqual(orderedNavigator.currentVCIndex, 0)
    }
}
