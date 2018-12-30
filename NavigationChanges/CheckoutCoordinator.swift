//
//  Checkout.swift
//  NavigationChanges
//
//  Created by Alex on 12/28/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import UIKit

class CheckoutCoordinator {
    let navigationController = UINavigationController()
    let viewControllers: [UIViewController]
    var currentViewIndex = 0
    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        navigationController.setViewControllers([viewControllers[0]], animated: false)
    }
    func initialViewController() -> UIViewController {
        return navigationController
    }
    func next() {
        currentViewIndex += 1
        let viewController = viewControllers[currentViewIndex]
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
    let selectItemVC = SelectItemVC()
    let selectLocationVC = SelectLocationVC()
    let confirmationVC = ConfirmationVC()
    let viewControllers = [selectItemVC, selectLocationVC, confirmationVC]
    let coordinator = CheckoutCoordinator(viewControllers: viewControllers)
    selectItemVC.onButtonClick = { [weak coordinator] in coordinator?.next() }
    selectLocationVC.onButtonClick = { [weak coordinator] in coordinator?.next() }
    return coordinator
}
