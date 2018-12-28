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
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigator = OrderedNavigator()
        let selectItemVC = SelectItemVC(navigator: navigator)
        window?.rootViewController = UINavigationController(rootViewController: selectItemVC)
        window?.makeKeyAndVisible()
        return true
    }
}

