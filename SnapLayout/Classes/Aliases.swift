//
//  Aliases.swift
//  Pods
//
//  Created by Satinder Singh on 5/6/17.
//
//

#if os(iOS) || os(tvOS)
    /// Allows views to be OS independent while leveraging existing code
    public typealias View = UIView
    /// Allows layout priority to be OS independent while leveraging existing code
    public typealias LayoutPriority = UILayoutPriority
    /// Allows layout priority required to be OS independent while leveraging existing code
    public var LayoutPriorityRequired = UILayoutPriorityRequired
#elseif os(OSX)
    /// Allows views to be OS independent while leveraging existing code
    public typealias View = NSView
    /// Allows layout priority to be OS independent while leveraging existing code
    public typealias LayoutPriority = NSLayoutPriority
    /// Allows layout priority required to be OS independent while leveraging existing code
    public var LayoutPriorityRequired = NSLayoutPriorityRequired
#endif
