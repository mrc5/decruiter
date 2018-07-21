//
//  AppTabbarController.swift
//  decruiter
//
//  Created by Marcus on 21.07.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class AppTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabbar()
    }
    
    private func setupTabbar() {
        let templateController = TemplateController()
        let templateTabbarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        templateController.tabBarItem = templateTabbarItem
        
        let generateController = GenerateViewController()
        let generateTabbarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        generateController.tabBarItem = generateTabbarItem
        
        let myTemplatesController = MyTemplatesController()
        let myTemplatesTabbarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        myTemplatesController.tabBarItem = myTemplatesTabbarItem
        
        let settingsController = SettingsController()
        let settingsTabbarItem = UITabBarItem(tabBarSystemItem: .history, tag: 3)
        settingsController.tabBarItem = settingsTabbarItem
        
        let viewControllerList = [templateController, generateController, myTemplatesController, settingsController]
        
        self.viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
}
