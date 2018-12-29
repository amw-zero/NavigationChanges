//
//  SelectItemVC.swift
//  NavigationChanges
//
//  Created by Alex on 12/27/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import UIKit

class SelectItemVC: UIViewController {
    weak var navigator: OrderedNavigation?
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    @objc func onItemSelected() {
        navigator?.next()
    }
    func layoutView() {
        view.backgroundColor = .white
        let button = UIButton(type: .system)
        button.setTitle("Select Item", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onItemSelected), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

