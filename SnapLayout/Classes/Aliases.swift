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
#elseif os(OSX)
    /// Allows views to be OS independent while leveraging existing code
    public typealias View = NSView
#endif
