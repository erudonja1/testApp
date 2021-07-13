//
//  AppDelegate.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let homeRouter = HomeRouter()
        window = homeRouter.createIntialWindow()
        
        return true
    }

}

