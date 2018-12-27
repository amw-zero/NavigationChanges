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
    func layoutView() {
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "Select Location"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
