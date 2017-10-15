//
//  Aliases.swift
//  Pods
//
//  Created by Satinder Singh on 5/6/17.
//
//

#if os(iOS) || os(tvOS)
    import UIKit
    /// Allows views to be OS independent while leveraging existing code
    public typealias View = UIView
    /// Allows layout priority to be OS independent while leveraging existing code
    public typealias LayoutPriority = UILayoutPriority
    /// Allows layout priority required to be OS independent while leveraging existing code
    public var LayoutPriorityRequired = UILayoutPriority(1000)
#else
    import AppKit
    /// Allows views to be OS independent while leveraging existing code
    public typealias View = NSView
    /// Allows layout priority to be OS independent while leveraging existing code
    public typealias LayoutPriority = NSLayoutConstraint.Priority
    /// Allows layout priority required to be OS independent while leveraging existing code
    public var LayoutPriorityRequired = NSLayoutConstraint.Priority(1000)
#endif
