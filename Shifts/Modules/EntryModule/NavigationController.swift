//
//  NavigationController.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupListModule()
    }

    func setupNavigationBar() {
        navigationBar.prefersLargeTitles = true
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
    
    func setupListModule() {
        if let vc = viewControllers.first as? ListViewProtocol {
            ListModuleConfigurator.configure(view: vc)
        }
    }
}
