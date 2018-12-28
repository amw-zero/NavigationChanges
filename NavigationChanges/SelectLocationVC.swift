//
//  SelectLocationVC.swift
//  NavigationChanges
//
//  Created by Alex on 12/27/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import UIKit

class SelectLocationVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    @objc func navigateToConfirmationViewController() {
        navigationController?.pushViewController(ConfirmationVC(), animated: false)
    }
    func layoutView() {
        view.accessibilityIdentifier = "selectLocationView"
        view.backgroundColor = .white
        let button = UIButton(type: .system)
        button.accessibilityIdentifier = "selectLocationButton"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Location", for: .normal)
        button.addTarget(self, action: #selector(navigateToConfirmationViewController), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
