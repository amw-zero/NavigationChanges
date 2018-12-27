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

// Select Item -> Select Location -> Confirmation
// Select Location -> Select Item -> Select Time -> Confirmation

class NavigationChangesTests: XCTestCase {
    func testNavigatingToLocationSelection() {
        let selectItemVC = SelectItemVC()
        let navigationController = UINavigationController(rootViewController: selectItemVC)
        selectItemVC.navigateToSelectLocationViewController()
        XCTAssert(navigationController.topViewController is SelectLocationVC)
    }
}
