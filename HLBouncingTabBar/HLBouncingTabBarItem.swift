//
//  HLBouncingTabBarItem.swift
//  HLBouncingTabBarSample
//
//  Created by Hervé Heurtault de Lammerville on 06/11/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import UIKit

class HLBouncingTabBarItem: NSObject {
   
    private var backgroundColor: UIColor?
    private var enableTintColor: UIColor?
    private var disableTintColor: UIColor?
    private var icon: UIImage?
    
    //MARK: - Initialization
    
    init(backgroundColor: UIColor?, selectedTintColor enableTintColor: UIColor?, unselectedTintColor disableTintColor: UIColor?, andIcon icon: UIImage?) {
        self.backgroundColor = backgroundColor
        self.enableTintColor = enableTintColor
        self.disableTintColor = disableTintColor
        self.icon = icon
    }
}
