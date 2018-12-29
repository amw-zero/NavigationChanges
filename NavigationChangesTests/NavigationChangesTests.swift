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
    // Wizard
    func testOrderedNavigatorNext() {
        let viewControllers: [View] = [.selectItem, .selectLocation]
        let wizard = Wizard(viewControllers: viewControllers)
        let nextWizard = wizard.next()
        XCTAssertEqual(nextWizard.current, .selectLocation)
        XCTAssertEqual(nextWizard.currentIndex, 1)
    }
    // Navigator
    func testNavigationExecution() {
        let wizard = Wizard(viewControllers: [
            .selectItem, .selectLocation
        ])
        let navigator = CheckoutCoordinator(wizard: wizard)
        navigator.next()
        XCTAssert(navigator.navigationController.topViewController is SelectLocationVC)
    }
}
