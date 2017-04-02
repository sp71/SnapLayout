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

class SnapManagerTests: XCTestCase {

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
        let parentView = UIView()
        let childView = UIView()
        parentView.addSubview(childView)
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
        let view = UIView()
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
        let view = UIView()
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
        let view = UIView()
        let otherView = UIView()
        let containerView = UIView()
        containerView.addSubview(view)
        containerView.addSubview(otherView)
        let snapManager = view.snap(to: otherView, constants: .zero)
        XCTAssertEqual(view.translatesAutoresizingMaskIntoConstraints, false)
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
        let parentView = UIView()
        let childView = UIView()
        parentView.addSubview(childView)
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

}
