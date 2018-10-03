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
        let generateController = UserTemplatesController()
        let userTemplatesController = GenerateViewController()
        let settingsController = SettingsController()
        
        templatesController.tabBarItem = UITabBarItem(
            title: "Templates",
            image: UIImage(named: "cloud"),
            selectedImage: UIImage(named: "cloud_filled"))
        generateController.tabBarItem = UITabBarItem(
            title: "My Templates",
            image: UIImage(named: "my_templates"),
            selectedImage: UIImage(named: "my_templates_filled"))
        userTemplatesController.tabBarItem = UITabBarItem(
            title: "decruiten",
            image: UIImage(named: "compose"),
            selectedImage: UIImage(named: "compose_filled"))
        settingsController.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(named: "settings"),
            selectedImage: UIImage(named: "settings_filled"))
        
        let controllers = [templatesController, generateController, userTemplatesController, settingsController]
        self.viewControllers = controllers.map({UINavigationController(rootViewController: $0)})
    }
}
