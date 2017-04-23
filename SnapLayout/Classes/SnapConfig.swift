//
//  SnapConfig.swift
//  Pods
//
//  Created by Satinder Singh on 3/28/17.
//
//

/// Holds constant values that can be fed into `SnapManager` or `UIView` extension methods
public struct SnapConfig {

    /// Constant value associated with top constraint. If nil, no constraint is applied.
    public var top: CGFloat?

    /// Constant value associated with leading constraint. If nil, no constraint is applied.
    public var leading: CGFloat?

    /// Constant value associated with bottom constraint. If nil, no constraint is applied.
    public var bottom: CGFloat?

    /// Constant value associated with trailing constraint. If nil, no constraint is applied.
    public var trailing: CGFloat?

    /// Constant value associated with width constraint. If nil, no constraint is applied.
    public var width: CGFloat?

    /// Constant value associated with height constraint. If nil, no constraint is applied.
    public var height: CGFloat?

    /// Value associated with centerX constraint. If nil, no constraint is applied.
    public var centerX: CGFloat?

    /// Value associated with centerY constraint. If nil, no constraint is applied.
    public var centerY: CGFloat?

    /// Constant value associated with zero for top, leading, bottom, and trailing.
    /// No width, height, centerX nor centerY constraint is applied.
    public static let zero = SnapConfig(top: 0, leading: 0, bottom: 0, trailing: 0)

    /// Initalizes `SnapConfig` for specified arguments. Unspecified arguments will be set to nil.
    ///
    /// - Parameters:
    ///   - top: Constant value associated with top constraint. If nil, no constraint is applied.
    ///   - leading: Constant value associated with leading constraint. If nil, no constraint is applied.
    ///   - bottom: Constant value associated with bottom constraint. If nil, no constraint is applied.
    ///   - trailing: Constant to apply from trailingAnchor  (if nil, not applied)
    ///   - width: Constant value associated with width constraint. If nil, no constraint is applied.
    ///   - height: Constant to apply from heightAnchor  (if nil, not applied)
    ///   - centerX: Constant offset to apply from centerXAnchor  (if nil, not applied)
    ///   - centerY: Constant offset to apply from centerXAnchor  (if nil, not applied)
    public init(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil,
                trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil,
                centerX: CGFloat? = nil, centerY: CGFloat? = nil) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
        self.width = width
        self.height = height
        self.centerX = centerX
        self.centerY = centerY
    }

}
