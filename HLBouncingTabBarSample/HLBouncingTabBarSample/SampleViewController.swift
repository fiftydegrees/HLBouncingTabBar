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
        tabBar.cursorBackgroundColor = UIColor.whiteColor()
    }
    
    @IBAction func didTapTest(sender: AnyObject) {
    }
}

