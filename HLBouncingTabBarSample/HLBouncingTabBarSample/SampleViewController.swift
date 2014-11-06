//
//  ViewController.swift
//  HLBouncingTabBarSample
//
//  Created by Hervé Heurtault de Lammerville on 06/11/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var tabBar: HLBouncingTabBar = self.tabBarController?.tabBar as HLBouncingTabBar
        
        tabBar.putItem(HLBouncingTabBarItem(backgroundColor: UIColor.yellowColor(), selectedTintColor: UIColor.whiteColor(), unselectedTintColor: UIColor.grayColor(), andIcon: UIImage(named: "burger1.png")), atIndex: 0)
        
        tabBar.putItem(HLBouncingTabBarItem(backgroundColor: UIColor.redColor(), selectedTintColor: UIColor.whiteColor(), unselectedTintColor: UIColor.yellowColor(), andIcon: UIImage(named: "hot17.png")), atIndex: 0)
    }
    
    @IBAction func didTapTest(sender: AnyObject) {
        
        var tabBar: HLBouncingTabBar = self.tabBarController?.tabBar as HLBouncingTabBar
        tabBar.test()
    }
}

