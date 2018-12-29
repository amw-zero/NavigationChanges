//
//  SelectLocationVC.swift
//  NavigationChanges
//
//  Created by Alex on 12/27/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import UIKit

class SelectLocationVC: UIViewController {
    weak var navigator: OrderedNavigation?
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    @objc func onLocationSelected() {
        navigator?.next()
    }
    func layoutView() {
        view.backgroundColor = .white
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Location", for: .normal)
        button.addTarget(self, action: #selector(onLocationSelected), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
