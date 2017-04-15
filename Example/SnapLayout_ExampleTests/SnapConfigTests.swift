//
//  SnapConfigTests.swift
//  SnapLayout
//
//  Created by Satinder Singh on 3/30/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import SnapLayout

/// Tests SnapConfig
class SnapConfigTests: XCTestCase {

    /// Test Snap Config Constructor
    func testSnapConfigConstructor() {
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
        XCTAssertNotNil(snapConfig.top)
        XCTAssertEqual(snapConfig.top, topConstant)
        XCTAssertNotNil(snapConfig.leading)
        XCTAssertEqual(snapConfig.leading, leadingConstant)
        XCTAssertNotNil(snapConfig.bottom)
        XCTAssertEqual(snapConfig.bottom, bottomConstant)
        XCTAssertNotNil(snapConfig.trailing)
        XCTAssertEqual(snapConfig.trailing, trailingConstant)
        XCTAssertNotNil(snapConfig.width)
        XCTAssertEqual(snapConfig.width, widthConstant)
        XCTAssertNotNil(snapConfig.height)
        XCTAssertEqual(snapConfig.height, heightConstant)
        XCTAssertNotNil(snapConfig.centerX)
        XCTAssertEqual(snapConfig.centerX, centerXConstant)
        XCTAssertNotNil(snapConfig.centerY)
        XCTAssertEqual(snapConfig.centerY, centerYConstant)
    }

    /// Test Snap Config static zero constant
    func testSnapConfigZero() {
        let snapConfig = SnapConfig.zero
        XCTAssertNotNil(snapConfig.top)
        XCTAssertEqual(snapConfig.top, 0)
        XCTAssertNotNil(snapConfig.leading)
        XCTAssertEqual(snapConfig.leading, 0)
        XCTAssertNotNil(snapConfig.bottom)
        XCTAssertEqual(snapConfig.bottom, 0)
        XCTAssertNotNil(snapConfig.trailing)
        XCTAssertEqual(snapConfig.trailing, 0)
        XCTAssertNil(snapConfig.width)
        XCTAssertNil(snapConfig.height)
        XCTAssertNil(snapConfig.centerX)
        XCTAssertNil(snapConfig.centerY)
    }
    
}
