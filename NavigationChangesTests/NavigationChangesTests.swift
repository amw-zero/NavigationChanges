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

class NavigationChangesTests: XCTestCase {
    func testNavigatingToLocationSelection() {
        let selectItemVC = SelectItemVC()
        let navigationController = UINavigationController(rootViewController: selectItemVC)
        selectItemVC.navigateToSelectLocationViewController()
        XCTAssert(navigationController.topViewController is SelectLocationVC)
    }
    func testNavigatingToConfirmation() {
        let selectLocationVC = SelectLocationVC()
        let navigationController = UINavigationController(rootViewController: selectLocationVC)
        selectLocationVC.navigateToConfirmationViewController()
        XCTAssert(navigationController.topViewController is ConfirmationVC)
    }
}
