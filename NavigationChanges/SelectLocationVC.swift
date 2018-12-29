//
//  SelectLocationVC.swift
//  NavigationChanges
//
//  Created by Alex on 12/27/18.
//  Copyright © 2018 VTS. All rights reserved.
//

import UIKit

class SelectLocationVC: UIViewController {
    let onButtonClick: () -> Void
    init(onButtonClick: @escaping () -> Void) {
        self.onButtonClick = onButtonClick
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        self.onButtonClick = { }
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    @objc func selectLocation() {
        onButtonClick()
    }
    func layoutView() {
        view.accessibilityIdentifier = "selectLocationView"
        view.backgroundColor = .white
        let button = UIButton(type: .system)
        button.accessibilityIdentifier = "selectLocationButton"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Location", for: .normal)
        button.addTarget(self, action: #selector(selectLocation), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
