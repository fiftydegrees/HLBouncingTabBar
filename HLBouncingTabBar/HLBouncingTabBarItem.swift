//
//  HLBouncingTabBarItem.swift
//  HLBouncingTabBarSample
//
//  Created by Hervé Heurtault de Lammerville on 06/11/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import UIKit

class HLBouncingTabBarItem: UIBarButtonItem {
   
    private var icon: UIImage?
    
    private var backgroundColor: UIColor?
    
    private var selected: Bool = false {
        didSet {
            updateSelectedState()
        }
    }
    
    //MARK: - Initialization
    
    init(backgroundColor: UIColor?) {
        super.init()
        self.backgroundColor = backgroundColor
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - UI Update
    
    func updateSelectedState() -> Void {
    }
}
