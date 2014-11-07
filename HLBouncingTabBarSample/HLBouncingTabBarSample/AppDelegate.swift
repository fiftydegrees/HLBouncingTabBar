//
//  AppDelegate.swift
//  HLBouncingTabBarSample
//
//  Created by Hervé Heurtault de Lammerville on 06/11/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        var tabBarController: UITabBarController? = self.window?.rootViewController? as UITabBarController?
        tabBarController?.delegate = tabBarController?.tabBar as HLBouncingTabBar
        
        return true
    }
}

