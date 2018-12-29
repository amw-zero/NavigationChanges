//
//  OrderedNavigator.swift
//  NavigationChanges
//
//  Created by Alex on 12/28/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import UIKit

protocol OrderedNavigation: class {
    func next()
}

class OrderedNavigator: OrderedNavigation {
    let navigationController = UINavigationController()
    let viewControllers: [UIViewController]
    var currentVCIndex = 0
    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
    func initialViewController() -> UIViewController {
        navigationController.setViewControllers([viewControllers[0]], animated: false)
        return navigationController
    }
    func next() {
        currentVCIndex += 1
        let viewController = viewControllers[currentVCIndex]
        viewController.navigationItem.hidesBackButton = true
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        navigationController.pushViewController(viewController, animated: false)
    }
    @objc func back() {
        currentVCIndex -= 1
        navigationController.popViewController(animated: false)
    }
}

func makeCheckoutNavigator() -> OrderedNavigator {
    let selectItemVC = SelectItemVC()
    let selectLocationVC = SelectLocationVC()
    let confirmationVC = ConfirmationVC()
    let viewControllers = [
        selectLocationVC,
        selectItemVC,
        confirmationVC
    ]
    let navigator = OrderedNavigator(viewControllers: viewControllers)
    selectItemVC.navigator = navigator
    selectLocationVC.navigator = navigator
    return navigator
}
