//
//  AppDelegate.swift
//  NavigationChanges
//
//  Created by Alex on 12/27/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var checkoutCoordinator: CheckoutCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        checkoutCoordinator = makeCheckoutCoordinator()
        window?.rootViewController = checkoutCoordinator?.initialViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

