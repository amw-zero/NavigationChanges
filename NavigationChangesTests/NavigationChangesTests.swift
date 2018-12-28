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
    func testNavigatingToConfirmation() {
        let selectItemVC = SelectItemVC()
        let navigationController = UINavigationController(rootViewController: selectItemVC)
        selectItemVC.navigateToConfirmationViewController()
        XCTAssert(navigationController.topViewController is ConfirmationVC)
    }
    func testNavigatingToSelectItem() {
        let selectLocationVC = SelectLocationVC()
        let navigationController = UINavigationController(rootViewController: selectLocationVC)
        selectLocationVC.navigateToSelectItemViewController()
        XCTAssert(navigationController.topViewController is SelectItemVC)
    }
}
