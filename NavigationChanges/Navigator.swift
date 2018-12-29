//
//  Checkout.swift
//  NavigationChanges
//
//  Created by Alex on 12/28/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import UIKit

enum View {
    case selectItem
    case selectLocation
    case confirmation
}

func makeCheckoutViewController(for view: View, navigator: CheckoutCoordinator) -> UIViewController {
    switch view {
    case .selectItem:
        return SelectItemVC { [weak navigator] in navigator?.next() }
    case .selectLocation:
        return SelectLocationVC { [weak navigator] in navigator?.next() }
    case .confirmation:
        return ConfirmationVC()
    }
}

class CheckoutCoordinator {
    let navigationController = UINavigationController()
    let views: [View]
    var currentViewIndex = 0
    init(views: [View]) {
        self.views = views
    }
    func initialViewController() -> UIViewController {
        let vc = makeCheckoutViewController(for: views[0], navigator: self)
        navigationController.setViewControllers([vc], animated: false)
        return navigationController
    }
    func next() {
        currentViewIndex += 1
        let viewController = makeCheckoutViewController(for: views[currentViewIndex], navigator: self)
        viewController.navigationItem.hidesBackButton = true
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(back))
        navigationController.pushViewController(viewController, animated: false)
    }
    @objc func back() {
        currentViewIndex -= 1
        navigationController.popViewController(animated: false)
    }
}

func makeCheckoutCoordinator() -> CheckoutCoordinator {
    return CheckoutCoordinator(views: [.selectItem, .selectLocation, .confirmation])
}
