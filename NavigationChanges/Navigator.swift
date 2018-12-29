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

struct Wizard {
    let viewControllers: [View]
    let currentIndex: Int
    init(viewControllers: [View], currentIndex: Int = 0) {
        self.viewControllers = viewControllers
        self.currentIndex = currentIndex
    }
    var current: View {
        return viewControllers[currentIndex]
    }
    func next() -> Wizard {
        return Wizard(
            viewControllers: viewControllers,
            currentIndex: currentIndex + 1)
    }
    func previous() -> Wizard {
        return Wizard(
            viewControllers: viewControllers,
            currentIndex: currentIndex - 1)
    }
}

class CheckoutCoordinator {
    let navigationController = UINavigationController()
    var wizard: Wizard
    init(wizard: Wizard) {
        self.wizard = wizard
    }
    func initialViewController() -> UIViewController {
        let vc = makeCheckoutViewController(for: wizard.viewControllers[0], navigator: self)
        navigationController.setViewControllers([vc], animated: false)
        return navigationController
    }
    func next() {
        wizard = wizard.next()
        let viewController = makeCheckoutViewController(for: wizard.current, navigator: self)
        viewController.navigationItem.hidesBackButton = true
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(back))
        navigationController.pushViewController(viewController, animated: false)
    }
    @objc func back() {
        wizard = wizard.previous()
        navigationController.popViewController(animated: false)
    }
}

func makeCheckoutCoordinator() -> CheckoutCoordinator {
    let wizard = Wizard(viewControllers: [
        .selectItem, .selectLocation, .confirmation
    ])
    return CheckoutCoordinator(wizard: wizard)
}
