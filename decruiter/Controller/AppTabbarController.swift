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
        let moreController = MoreController()
        
        templatesController.tabBarItem = UITabBarItem(
            title: "Templates",
            image: UIImage(named: "round_cloud_black"),
            selectedImage: UIImage(named: "round_cloud_black"))
        generateController.tabBarItem = UITabBarItem(
            title: "My Templates",
            image: UIImage(named: "round_save_black"),
            selectedImage: UIImage(named: "round_save_black"))
        userTemplatesController.tabBarItem = UITabBarItem(
            title: "decruiten",
            image: UIImage(named: "round_create_black"),
            selectedImage: UIImage(named: "round_create_black"))
        moreController.tabBarItem = UITabBarItem(
            title: "More",
            image: UIImage(named: "round_more_horiz_black"),
            selectedImage: UIImage(named: "round_more_horiz_black"))
        
        let controllers = [templatesController, generateController, userTemplatesController, moreController]
        self.viewControllers = controllers.map({UINavigationController(rootViewController: $0)})
    }
}
