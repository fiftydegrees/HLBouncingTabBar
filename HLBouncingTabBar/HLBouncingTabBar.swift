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
    
    private var dynamicAnimator: UIDynamicAnimator?
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
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self)
    }
    
    //MARK: - Items Management
    
    func putItem(item: HLBouncingTabBarItem, atIndex index: Int) -> Void {
        
        assert(index >= 0, "Index must be greater than or equal to 0")
        assert(index < 5, "Index must be lower than or equal to 4")
        
        itemArray.insert(item, atIndex: index)
        
        updateCursorPositionAnimated(false)
    }
    
    func removeItemAtIndex(index: Int) -> Void {
        
        assert(index >= 0, "Index must be greater than or equal to 0")
        assert(index < 5, "Index must be lower than or equal to 4")
        
        itemArray.removeAtIndex(index)
        
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
    }
    
    func updateCursorPositionAnimated(animated: Bool) -> Void {
        updateCursorSize()
        
        var finalExpectedFrame: CGRect = CGRectMake(CGFloat(self.cursorIndex) * CGRectGetWidth(self.cursorView.frame), CGRectGetMinY(self.cursorView.frame), CGRectGetWidth(self.cursorView.frame), CGRectGetHeight(self.cursorView.frame))
        
        if (animated) {
            
            self.dynamicAnimator?.removeAllBehaviors()
            
            var offset: CGFloat = (CGRectGetMinX(finalExpectedFrame) > CGRectGetMinX(self.cursorView.frame)) ? CGRectGetWidth(self.cursorView.frame) + 1 : -1
            
            var gravityBehavior: UIGravityBehavior = UIGravityBehavior(items: [self.cursorView])
            gravityBehavior.gravityDirection = CGVectorMake((CGRectGetMinX(finalExpectedFrame) > CGRectGetMinX(self.cursorView.frame)) ? 4.0 : -4.0, 0.0)
            self.dynamicAnimator?.addBehavior(gravityBehavior)
            
            var elasticityBehavior: UIDynamicItemBehavior = UIDynamicItemBehavior(items: [self.cursorView])
            elasticityBehavior.elasticity = 0.1
            self.dynamicAnimator?.addBehavior(elasticityBehavior)
            
            var collisionBehavior: UICollisionBehavior = UICollisionBehavior(items: [self.cursorView])
            collisionBehavior.translatesReferenceBoundsIntoBoundary = true
            collisionBehavior.addBoundaryWithIdentifier("collision", fromPoint: CGPointMake(CGRectGetMinX(finalExpectedFrame) + offset, CGRectGetMinY(finalExpectedFrame)), toPoint: CGPointMake(CGRectGetMinX(finalExpectedFrame) + offset, CGRectGetMinX(finalExpectedFrame) + CGRectGetHeight(self.frame)))
            self.dynamicAnimator?.addBehavior(collisionBehavior)
        }
        else {
            self.cursorView.frame = finalExpectedFrame
        }
    }
    
    //MARK: - UITabBarControllerDelegate Implementation
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        setSelectedIndex(tabBarController.selectedIndex)
    }
}
