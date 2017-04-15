//
//  BaseTestCase.swift
//  SnapLayout
//
//  Created by Satinder Singh on 4/14/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import XCTest

/// Holds boilerplate properies subclasses may use for testing purposes.
/// Manages view hierarchy of childView and parentView relationship throughout test cases
class BaseTestCase: XCTestCase {
    
    /// Child View of parent View
    let childView = UIView()
    
    /// Second child view of parent View
    let childView2 = UIView()
    
    /// Parent View of Child View
    let parentView = UIView()
    
    /// View that is neither a parent view nor child view
    let view = UIView()
    
    override func setUp() {
        super.setUp()
        parentView.addSubview(childView)
        parentView.addSubview(childView2)
    }
    
    override func tearDown() {
        childView.removeFromSuperview()
        childView2.removeFromSuperview()
    }

}
