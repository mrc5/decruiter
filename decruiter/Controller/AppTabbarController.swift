//
//  AppTabbarController.swift
//  decruiter
//
//  Created by Marcus on 25.09.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class AppTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarControllers()
    }
    
    private func setupTabbarControllers() {
        let templatesController = TemplatesController()
        let generateController = GenerateViewController()
        let userTemplatesController = UserTemplatesController()
        let settingsController = SettingsController()
        
        templatesController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        generateController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        userTemplatesController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        settingsController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 3)
        
        let controllers = [templatesController, generateController, userTemplatesController, settingsController]
        self.viewControllers = controllers.map({UINavigationController(rootViewController: $0)})
    }
}
