//
//  HLBouncingTabBar.swift
//  HLBouncingTabBarSample
//
//  Created by Hervé Heurtault de Lammerville on 06/11/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import UIKit

class HLBouncingTabBar: UITabBar, UITabBarControllerDelegate {
    
    private var itemArray: [HLBouncingTabBarItem] = []
    
    private var cursorView: UIView = UIView()
    private var cursorIndex: Int = 0
    
    override init() {
        super.init()
        setupTabBar()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTabBar()
    }
    
    //MARK: - Initialization
    
    func setupTabBar() -> Void {
        self.translucent = false
        self.addSubview(cursorView)
        self.cursorIndex = 0
        self.cursorView.backgroundColor = UIColor.redColor()
        self.cursorView.userInteractionEnabled = false
    }
    
    //MARK: - Items Management
    
    func putItem(item: HLBouncingTabBarItem, atIndex index: Int) -> Void {
        
        assert(index >= 0, "Index must be greater than or equal to 0")
        assert(index < 5, "Index must be lower than or equal to 4")
        
        itemArray.insert(item, atIndex: index)
        
        updateCursorSize()
        updateCursorPositionAnimated(false)
    }
    
    func removeItemAtIndex(index: Int) -> Void {
        
        assert(index >= 0, "Index must be greater than or equal to 0")
        assert(index < 5, "Index must be lower than or equal to 4")
        
        itemArray.removeAtIndex(index)
        
        updateCursorSize()
        updateCursorPositionAnimated(false)
    }
    
    //MARK: - TabBar Actions
    
    func setSelectedIndex(index: Int) -> Void {
        cursorIndex = index
        updateCursorPositionAnimated(true)
    }
    
    func test() -> Void {
        setSelectedIndex(1)
    }
    
    //MARK: - Internal
    
    func updateCursorSize() -> Void {
        cursorView.frame = CGRectMake(CGRectGetMinX(cursorView.frame), CGRectGetMinY(cursorView.frame), CGRectGetWidth(self.frame) / CGFloat(itemArray.count), CGRectGetHeight(self.frame))
        NSLog("UpdatedCursorSize: %@", NSStringFromCGRect(cursorView.frame))
    }
    
    func updateCursorPositionAnimated(animated: Bool) -> Void {
        updateCursorSize()
        
        UIView.animateWithDuration(animated ? 0.2 : 0.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.cursorView.frame = CGRectMake(CGFloat(self.cursorIndex) * CGRectGetWidth(self.cursorView.frame), CGRectGetMinY(self.cursorView.frame), CGRectGetWidth(self.cursorView.frame), CGRectGetHeight(self.cursorView.frame))
        }, completion: nil)
    }
    
    //MARK: - UITabBarDelegate Implementation
    
}
