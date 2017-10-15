//
//  Anchorable.swift
//  SnapLayout
//
//  Created by Satinder Singh on 10/14/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

/// UIView and UILayoutGuide both share these properties but Apple did not create a shared protocol. This makes up for it.
public protocol Anchorable {
    
    /// Leading Anchor
    var leadingAnchor: NSLayoutXAxisAnchor { get }

    /// Trailing Anchor
    var trailingAnchor: NSLayoutXAxisAnchor { get }

    /// Left Anchor
    var leftAnchor: NSLayoutXAxisAnchor { get }

    /// Right Anchor
    var rightAnchor: NSLayoutXAxisAnchor { get }

    /// Top Anchor
    var topAnchor: NSLayoutYAxisAnchor { get }

    /// Bottom Anchor
    var bottomAnchor: NSLayoutYAxisAnchor { get }

    /// Width Anchor
    var widthAnchor: NSLayoutDimension { get }

    /// Height Anchor
    var heightAnchor: NSLayoutDimension { get }

    /// Center X Anchor
    var centerXAnchor: NSLayoutXAxisAnchor { get }

    /// Center Y Anchor
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

// MARK: - View Extension
extension View: Anchorable {

    /// Since iOS 11 encourages `safeAreaLayoutGuide` but previous OS versions do not support this,
    /// this ensures caller uses appropriate anchors by taking into account OS.
    /// - Parameters:
    ///   - view: View to return or its `safeAreaLayoutGuide` if possible
    var os_anchors: Anchorable {
        #if os(OSX)
            return self
        #else
            if #available(iOS 11.0, tvOS 11.0, *) {
                return safeAreaLayoutGuide
            } else {
                return self
            }
        #endif
    }

}

// MARK: - LayoutGuide Extension
#if os(iOS) || os(tvOS)
    extension UILayoutGuide: Anchorable { }
#endif
