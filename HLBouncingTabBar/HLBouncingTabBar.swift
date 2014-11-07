//
//  HLBouncingTabBar.swift
//  HLBouncingTabBarSample
//
//  Created by Hervé Heurtault de Lammerville on 06/11/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import UIKit

class HLBouncingTabBar: UITabBar, UITabBarControllerDelegate {
    
    var cursorBackgroundColor: UIColor = UIColor.clearColor() {
        didSet {
            self.cursorView.backgroundColor = cursorBackgroundColor
        }
    }
    
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
        self.sendSubviewToBack(cursorView)
        self.cursorIndex = 0
        self.cursorView.backgroundColor = self.cursorBackgroundColor
        self.cursorView.userInteractionEnabled = false
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self)
        updateCursorPositionAnimated(false)
    }
    
    //MARK: - TabBar Actions
    
    func setSelectedIndex(index: Int) -> Void {
        cursorIndex = index
        updateCursorPositionAnimated(true)
    }
    
    //MARK: - Internal
    
    func updateCursorSize() -> Void {
        var itemsCount: Int? = self.items?.count
        self.cursorView.frame = CGRectMake(CGRectGetMinX(cursorView.frame), CGRectGetMinY(cursorView.frame), CGRectGetWidth(UIScreen.mainScreen().bounds) / CGFloat(itemsCount!), CGRectGetHeight(self.frame))
    }
    
    func updateCursorPositionAnimated(animated: Bool) -> Void {
        updateCursorSize()
        var finalExpectedFrame: CGRect = CGRectMake(CGFloat(self.cursorIndex) * CGRectGetWidth(self.cursorView.frame), CGRectGetMinY(self.cursorView.frame), CGRectGetWidth(self.cursorView.frame), CGRectGetHeight(self.cursorView.frame))
        if (animated) {
            self.dynamicAnimator?.removeAllBehaviors()
            
            var offset: CGFloat = (CGRectGetMinX(finalExpectedFrame) > CGRectGetMinX(self.cursorView.frame)) ? CGRectGetWidth(self.cursorView.frame) + 1 : -1
            
            var gravityBehavior: UIGravityBehavior = UIGravityBehavior(items: [self.cursorView])
            gravityBehavior.gravityDirection = CGVectorMake((CGRectGetMinX(finalExpectedFrame) > CGRectGetMinX(self.cursorView.frame)) ? 8.0 : -8.0, 0.0)
            self.dynamicAnimator?.addBehavior(gravityBehavior)
            
            var elasticityBehavior: UIDynamicItemBehavior = UIDynamicItemBehavior(items: [self.cursorView])
            elasticityBehavior.elasticity = 0.25
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
