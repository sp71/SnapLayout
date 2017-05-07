//
//  Aliases.swift
//  Pods
//
//  Created by Satinder Singh on 5/6/17.
//
//

#if os(iOS)
    public typealias View = UIView
#elseif os(OSX)
    public typealias View = NSView
#endif
