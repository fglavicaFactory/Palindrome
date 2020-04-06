//
//  AppDelegate.swift
//  PredavanjeBrojDva
//
//  Created by Filip Glavica on 09/03/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController =
        storyboard.instantiateInitialViewController()
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = initialViewController
        
        
        return true
    }

 

}

