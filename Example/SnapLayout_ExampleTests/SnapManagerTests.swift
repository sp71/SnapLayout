//
//  SnapManagerTests.swift
//  SnapLayout
//
//  Created by Satinder Singh on 3/30/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import SnapLayout

/// Tests SnapManager
class SnapManagerTests: BaseTestCase {

    /// Test Snap Manager Constructor
    func testSnapManagerConstructor() {
        let topConstant = CGFloat(0)
        let leadingConstant = CGFloat(8)
        let bottomConstant = CGFloat(16)
        let trailingConstant = CGFloat(24)
        let widthConstant = CGFloat(32)
        let heightConstant = CGFloat(64)
        let centerXConstant = true
        let centerYConstant = true
        let snapManager = childView.snap(top: topConstant,
                                    leading: leadingConstant,
                                    bottom: bottomConstant,
                                    trailing: trailingConstant,
                                    width: widthConstant,
                                    height: heightConstant,
                                    centerX: centerXConstant,
                                    centerY: centerYConstant)
        XCTAssertEqual(childView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertNotNil(snapManager.top)
        XCTAssertEqual(snapManager.top!.constant, topConstant)
        XCTAssertNotNil(snapManager.leading)
        XCTAssertEqual(snapManager.leading!.constant, leadingConstant)
        XCTAssertNotNil(snapManager.bottom)
        XCTAssertEqual(snapManager.bottom!.constant, bottomConstant)
        XCTAssertNotNil(snapManager.trailing)
        XCTAssertEqual(snapManager.trailing!.constant, trailingConstant)
        XCTAssertNotNil(snapManager.width)
        XCTAssertEqual(snapManager.width!.constant, widthConstant)
        XCTAssertNotNil(snapManager.height)
        XCTAssertEqual(snapManager.height!.constant, heightConstant)
        XCTAssertNotNil(snapManager.centerX)
        XCTAssertEqual(snapManager.centerX!.constant, 0)
        XCTAssertNotNil(snapManager.centerY)
        XCTAssertEqual(snapManager.centerY!.constant, 0)
    }

    /// Test Snap Manager Constructor with a view who does not have a superview
    func testSnapManagerConstructorWithoutSuperView() {
        let widthConstant = CGFloat(32)
        let heightConstant = CGFloat(64)
        let snapManager = view.snap(width: widthConstant, height: heightConstant)
        XCTAssertEqual(view.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertNotNil(snapManager.width)
        XCTAssertEqual(snapManager.width!.constant, widthConstant)
        XCTAssertNotNil(snapManager.height)
        XCTAssertEqual(snapManager.height!.constant, heightConstant)

        XCTAssertNil(snapManager.top)
        XCTAssertNil(snapManager.leading)
        XCTAssertNil(snapManager.bottom)
        XCTAssertNil(snapManager.trailing)
        XCTAssertNil(snapManager.centerX)
        XCTAssertNil(snapManager.centerY)
    }

    /// Test Snap Manager Constructor where a error would occur through logging
    func testSnapManagerConstructorError() {
        let snapManager = view.snap(trailing: 0)
        XCTAssertEqual(view.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertNil(snapManager.top)
        XCTAssertNil(snapManager.leading)
        XCTAssertNil(snapManager.bottom)
        XCTAssertNil(snapManager.trailing)
        XCTAssertNil(snapManager.width)
        XCTAssertNil(snapManager.height)
        XCTAssertNil(snapManager.centerX)
        XCTAssertNil(snapManager.centerY)
    }

    /// Test Snap Manager Constructor with view argument
    func testSnapManagerConstructorWithSnapConfigErrorForNotSharingSameViewHeirarchy() {
        let containerViewSubview = UIView()
        let otherView = UIView()
        let containerView = UIView()
        containerView.addSubview(containerViewSubview)
        containerView.addSubview(otherView)
        let snapManager = containerViewSubview.snap(to: otherView, constants: .zero)
        XCTAssertEqual(containerViewSubview.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertNotNil(snapManager.top)
        XCTAssertEqual(snapManager.top!.constant, 0)
        XCTAssertNotNil(snapManager.leading)
        XCTAssertEqual(snapManager.leading!.constant, 0)
        XCTAssertNotNil(snapManager.bottom)
        XCTAssertEqual(snapManager.bottom!.constant, 0)
        XCTAssertNotNil(snapManager.trailing)
        XCTAssertEqual(snapManager.trailing!.constant, 0)
        XCTAssertNil(snapManager.width)
        XCTAssertNil(snapManager.height)
        XCTAssertNil(snapManager.centerX)
        XCTAssertNil(snapManager.centerY)
    }

    /// Test Snap Manager Constructor with a config parameter
    func testSnapManagerConstructorWithSnapConfig() {
        let topConstant = CGFloat(0)
        let leadingConstant = CGFloat(8)
        let bottomConstant = CGFloat(16)
        let trailingConstant = CGFloat(24)
        let widthConstant = CGFloat(32)
        let heightConstant = CGFloat(64)
        let centerXConstant = true
        let centerYConstant = true
        let snapConfig = SnapConfig(top: topConstant,
                                    leading: leadingConstant,
                                    bottom: bottomConstant,
                                    trailing: trailingConstant,
                                    width: widthConstant,
                                    height: heightConstant,
                                    centerX: centerXConstant,
                                    centerY: centerYConstant)
        let snapManager = childView.snap(constants: snapConfig)
        XCTAssertEqual(childView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertNotNil(snapManager.top)
        XCTAssertEqual(snapManager.top!.constant, topConstant)
        XCTAssertNotNil(snapManager.leading)
        XCTAssertEqual(snapManager.leading!.constant, leadingConstant)
        XCTAssertNotNil(snapManager.bottom)
        XCTAssertEqual(snapManager.bottom!.constant, bottomConstant)
        XCTAssertNotNil(snapManager.trailing)
        XCTAssertEqual(snapManager.trailing!.constant, trailingConstant)
        XCTAssertNotNil(snapManager.width)
        XCTAssertEqual(snapManager.width!.constant, widthConstant)
        XCTAssertNotNil(snapManager.height)
        XCTAssertEqual(snapManager.height!.constant, heightConstant)
        XCTAssertNotNil(snapManager.centerX)
        XCTAssertEqual(snapManager.centerX!.constant, 0)
        XCTAssertNotNil(snapManager.centerY)
        XCTAssertEqual(snapManager.centerY!.constant, 0)
    }
    
    /// Test Snap Manager Config Constructor when used with chaining.
    /// Ensures SnapManager information is not lost during chaining
    func testSnapManagerConfigChainConstructor() {
        let topConstant = CGFloat(0)
        let leadingConstant = CGFloat(8)
        let bottomConstant = CGFloat(16)
        let trailingConstant = CGFloat(24)
        let widthConstant = CGFloat(32)
        let heightConstant = CGFloat(64)
        let centerXConstant = true
        let centerYConstant = true
        let snapConfig = SnapConfig(top: topConstant,
                                    leading: leadingConstant,
                                    bottom: bottomConstant,
                                    trailing: trailingConstant,
                                    width: widthConstant,
                                    height: heightConstant)
        let centerConfig = SnapConfig(centerX: centerXConstant, centerY: centerYConstant)
        let snapManager = childView.snap(constants: snapConfig)
                                   .snap(constants: centerConfig)
        XCTAssertNotNil(snapManager.top)
        XCTAssertEqual(snapManager.top!.constant, topConstant)
        XCTAssertNotNil(snapManager.leading)
        XCTAssertEqual(snapManager.leading!.constant, leadingConstant)
        XCTAssertNotNil(snapManager.bottom)
        XCTAssertEqual(snapManager.bottom!.constant, bottomConstant)
        XCTAssertNotNil(snapManager.trailing)
        XCTAssertEqual(snapManager.trailing!.constant, trailingConstant)
        XCTAssertNotNil(snapManager.width)
        XCTAssertEqual(snapManager.width!.constant, widthConstant)
        XCTAssertNotNil(snapManager.height)
        XCTAssertEqual(snapManager.height!.constant, heightConstant)
        XCTAssertNotNil(snapManager.centerX)
        XCTAssertNotNil(snapManager.centerY)
    }

    /// Tests Snap Manager width during chaining
    func testSnapManagerWidthConstructor() {
        let topConstant = CGFloat(10)
        let widthMultiplier = CGFloat(0.5)
        let snapManager = childView.snap(top: topConstant).snapWidth(to: parentView, multiplier: widthMultiplier)
        XCTAssertNotNil(snapManager.top)
        XCTAssertEqual(snapManager.top!.constant, topConstant)
        XCTAssertNotNil(snapManager.width)
        XCTAssertEqual(snapManager.width!.multiplier, widthMultiplier)
        XCTAssertEqual(snapManager.width!.constant, 0)
    }
    
    /// Tests Snap Manager height during chaining
    func testSnapManagerHeightConstructor() {
        let topConstant = CGFloat(10)
        let heightMultiplier = CGFloat(0.5)
        let snapManager = childView.snap(top: topConstant).snapHeight(to: parentView, multiplier: heightMultiplier)
        XCTAssertNotNil(snapManager.top)
        XCTAssertEqual(snapManager.top!.constant, topConstant)
        XCTAssertNotNil(snapManager.height)
        XCTAssertEqual(snapManager.height!.multiplier, heightMultiplier)
        XCTAssertEqual(snapManager.height!.constant, 0)
    }
    
    /// Tests Snap Manager Size during chaining
    func testSnapManagerSizeConstructor() {
        let bottomConstant = CGFloat(10)
        let size = CGSize(width: 30, height: 40)
        let snapManager = childView.snap(bottom: bottomConstant).snap(size: size)
        XCTAssertEqual(childView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertNotNil(snapManager.bottom)
        XCTAssertNotNil(snapManager.width)
        XCTAssertNotNil(snapManager.height)
        XCTAssertEqual(snapManager.bottom!.isActive, true)
        XCTAssertEqual(snapManager.width!.isActive, true)
        XCTAssertEqual(snapManager.height!.isActive, true)
        XCTAssertEqual(snapManager.bottom!.constant, bottomConstant)
        XCTAssertEqual(snapManager.width!.constant, size.width)
        XCTAssertEqual(snapManager.height!.constant, size.height)
        XCTAssertEqual(snapManager.width!.multiplier, 1.0)
        XCTAssertEqual(snapManager.height!.multiplier, 1.0)
    }
    
    /// Tests Snap Manager Trailing View during chaining
    func testSnapManagerTrailingViewConstructor() {
        let bottomConstant = CGFloat(10)
        let trailingConstant = CGFloat(8)
        let snapManager = childView.snap(bottom: bottomConstant).snap(trailingView: childView2, constant: trailingConstant)
        XCTAssertEqual(childView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(childView2.translatesAutoresizingMaskIntoConstraints, true)
        XCTAssertNotNil(snapManager.trailing)
        XCTAssertNotNil(snapManager.bottom)
        XCTAssertEqual(snapManager.trailing!.isActive, true)
        XCTAssertEqual(snapManager.bottom!.isActive, true)
        XCTAssertEqual(snapManager.trailing!.constant, trailingConstant)
        XCTAssertEqual(snapManager.bottom!.constant, bottomConstant)
        XCTAssertEqual(snapManager.trailing!.multiplier, 1.0)
        XCTAssertEqual(snapManager.bottom!.multiplier, 1.0)
    }
    
    /// Tests Snap Manager Leading View during chaining
    func testSnapLeadingView() {
        let bottomConstant = CGFloat(10)
        let leadingConstant = CGFloat(8)
        let snapManager = childView.snap(bottom: bottomConstant).snap(leadingView: childView2, constant: leadingConstant)
        XCTAssertEqual(childView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(childView2.translatesAutoresizingMaskIntoConstraints, true)
        XCTAssertNotNil(snapManager.leading)
        XCTAssertNotNil(snapManager.bottom)
        XCTAssertEqual(snapManager.leading!.isActive, true)
        XCTAssertEqual(snapManager.bottom!.isActive, true)
        XCTAssertEqual(snapManager.leading!.constant, leadingConstant)
        XCTAssertEqual(snapManager.bottom!.constant, bottomConstant)
        XCTAssertEqual(snapManager.leading!.multiplier, 1.0)
        XCTAssertEqual(snapManager.bottom!.multiplier, 1.0)
    }
    
    /// Tests Snap Manager Bottom View during chaining
    func testSnapBottomView() {
        let leadingConstant = CGFloat(8)
        let bottomConstant = CGFloat(10)
        let snapManager = childView.snap(leading: leadingConstant).snap(bottomView: childView2, constant: bottomConstant)
        XCTAssertEqual(childView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(childView2.translatesAutoresizingMaskIntoConstraints, true)
        XCTAssertNotNil(snapManager.bottom)
        XCTAssertNotNil(snapManager.leading)
        XCTAssertEqual(snapManager.bottom!.isActive, true)
        XCTAssertEqual(snapManager.leading!.isActive, true)
        XCTAssertEqual(snapManager.bottom!.constant, bottomConstant)
        XCTAssertEqual(snapManager.leading!.constant, leadingConstant)
        XCTAssertEqual(snapManager.bottom!.multiplier, 1.0)
        XCTAssertEqual(snapManager.leading!.multiplier, 1.0)
    }
    
    /// Tests Snap Manager Top View during chaining
    func testSnapTopView() {
        let leadingConstant = CGFloat(8)
        let topConstant = CGFloat(8)
        let snapManager = childView.snap(leading: leadingConstant).snap(topView: childView2, constant: topConstant)
        XCTAssertEqual(childView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(childView2.translatesAutoresizingMaskIntoConstraints, true)
        XCTAssertNotNil(snapManager.top)
        XCTAssertNotNil(snapManager.leading)
        XCTAssertEqual(snapManager.top!.isActive, true)
        XCTAssertEqual(snapManager.leading!.isActive, true)
        XCTAssertEqual(snapManager.top!.constant, topConstant)
        XCTAssertEqual(snapManager.leading!.constant, leadingConstant)
        XCTAssertEqual(snapManager.top!.multiplier, 1.0)
        XCTAssertEqual(snapManager.leading!.multiplier, 1.0)
    }


}
