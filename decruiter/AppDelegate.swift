//
//  AppDelegate.swift
//  decruiter
//
//  Created by Marcus on 14.03.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        let appTabbarViewController = AppTabbarController()
        window.rootViewController = appTabbarViewController
        window.makeKeyAndVisible()
        
        setupParse()
        return true
    }
    
    func setupParse() {
        let configuration = ParseClientConfiguration {
            $0.applicationId = "KpjKj0ErQW7uNdHnHkTuZosAVjrbIhd7rA9H6qCm"
            $0.clientKey = ""
            $0.server = "http://localhost:1337/parse"
        }
        Parse.enableLocalDatastore()
        Parse.initialize(with: configuration)
        
//        testRetrieve()
    }
    
    func testSave() {
        let gameScore = PFObject(className:"GameScore")
        gameScore["score"] = 1337
        gameScore["playerName"] = "Sean Plott"
        gameScore["cheatMode"] = false
        
        gameScore.saveInBackground {
            (success: Bool, error: Error?) in
            if (success) {
                print("The object has been saved.")
            } else {
                print("There was a problem, check error.description")
            }
        }
    }
    
    func testRetrieve() {

        let query = PFQuery(className: "GameScore")
        query.findObjectsInBackground { (objects, error) in
            if let err = error {
                print(err.localizedDescription)
            } else {
                guard let objects = objects else { return }
                
                for object in objects {
                    let score = object["score"] as! Int
                    let name = object["playerName"] as! String
                    let cheatMode = object["cheatMode"] as! Bool
                    print("Score: \(score)", "PlayerName: \(name)", "CheatMode: \(cheatMode.description)")
                }
            }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
