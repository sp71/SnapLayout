//
//  SnapLayout.swift
//  Pods
//
//  Created by Satinder Singh on 10/2/16.
//
//

/// Defines Constraint Axis alignment
public enum ConstraintAxis {
    
    /// Center only the X axis
    case centerX
    
    /// Center only the Y axis
    case centerY
    
    /// Center the X and Y axis
    case centerXAndY
}

/// Constraint Edge that can be applied
public struct ConstraintEdge {
    
    /// Applies Constraint for top
    public var top: CGFloat
    
    /// Applies Constraint for leading
    public var leading: CGFloat
    
    /// Applies Constraint for bottom
    public var bottom: CGFloat
    
    /// Applies Constraint for trailing
    public var trailing: CGFloat
    
    /// Initalizes a Constraint Edge with all values set to 0
    public init() {
        top = 0
        leading = 0
        bottom = 0
        trailing = 0
    }
    
    /// Initalizes ConstraintEdge with specified arguments
    ///
    /// - Parameters:
    ///   - top: Constant Value to apply with top
    ///   - leading: Constant Value to apply with leading
    ///   - bottom: Constant Value to apply with bottom
    ///   - trailing: Constant Value to apply with trailing
    public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
}

/// Constraint Edge Inset to apply to each Constraint Edge
public struct ConstraintEdgeInsets {
    
    /// Constant value associated with top constraint. If nil, no constraint is applied.
    public var top: CGFloat?
    
    /// Constant value associated with leading constraint. If nil, no constraint is applied.
    public var leading: CGFloat?
    
    /// Constant value associated with bottom constraint. If nil, no constraint is applied.
    public var bottom: CGFloat?
    
    /// Constant value associated with trailing constraint. If nil, no constraint is applied.
    public var trailing: CGFloat?
    
    /// Constant value associated with zero for all values
    public static let zero = ConstraintEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    public init(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
    
}

/// Manages Constraints for View
public class ConstraintManager {
    
    /// Leading Constraint
    public var leading: NSLayoutConstraint?
    
    /// Top Constraint
    public var top: NSLayoutConstraint?
    
    /// Trailing Constraint
    public var trailing: NSLayoutConstraint?
    
    /// Bottom Constraint
    public var bottom: NSLayoutConstraint?
    
    /// Width Constraint
    public var width: NSLayoutConstraint?
    
    /// Height Constraint
    public var height: NSLayoutConstraint?
    
    /// Center X Constraint
    public var centerX: NSLayoutConstraint?
    
    /// Center Y Constraint
    public var centerY: NSLayoutConstraint?
    
    /// Initalizes ConstraintManager with all properties set to nil
    init() {}
    
    /// Update Constraint Manager with specified constraint manager argument
    /// All properties from argument object will be applied to the calling constraint manager
    /// - Parameter otherCM: Other Constraint Manager to update calling constraint manager properties with
    func append(_ otherCM: ConstraintManager) -> ConstraintManager {
        if let otherLeading = otherCM.leading {
            leading = otherLeading
        }
        if let othertop = otherCM.top {
            top = othertop
        }
        if let otherTrailing = otherCM.trailing {
            trailing = otherTrailing
        }
        if let otherBottom = otherCM.bottom {
            bottom = otherBottom
        }
        if let otherWidth = otherCM.width {
            width = otherWidth
        }
        if let otherHeight = otherCM.height {
            height = otherHeight
        }
        if let otherCenterX = otherCM.centerX {
            centerX = otherCenterX
        }
        if let otherCenterY = otherCM.centerY {
            centerY = otherCenterY
        }
        return self
    }
}

/// Extension Methods for convenience
public extension UIView {
    
    // MARK: - Pin
    
    /// Pin to superview based on specified arguments. Nil parameters will not apply constraints
    /// - Note: If a view does not contain a superview, a ConstraintManager with all properties set to nil will be returned
    /// - Parameters:
    ///   - top: Constant to apply to top constraint from topAnchor
    ///   - leading: Constant to apply from leadingAnchor
    ///   - bottom: Constant to apply from bottomAnchor
    ///   - trailing: Constant to apply from trailingAnchor
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func pinToSuperview(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) -> ConstraintManager {
        guard let superview = superview else {
            return ConstraintManager()
        }
        return pin(view: superview, top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    
    /// Pin to superview based on constraintEdgeInsets parameter. Nil properties of ConstraintEdgeInsets will not apply constraints
    ///
    /// - Parameter constraintEdgeInsets: Manages edge insets to apply to view
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func pinToSuperview(_ insets: ConstraintEdgeInsets) -> ConstraintManager {
        return pinToSuperview(top: insets.top,
                              leading: insets.leading,
                              bottom: insets.bottom,
                              trailing: insets.trailing)
    }
    
    /// Pin to view based on argument values. Nil properties will not apply constraints.
    ///
    /// - Parameters:
    ///   - view: UIView to to apply constraints with
    ///   - top: Constant to apply to top constraint from topAnchor
    ///   - leading: Constant to apply from leadingAnchor
    ///   - bottom: Constant to apply from bottomAnchor
    ///   - trailing: Constant to apply from trailingAnchor
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func pin(view: UIView, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        var constraintManager = ConstraintManager()
        if let top = top {
            constraintManager.top = topAnchor.constraint(equalTo: view.topAnchor, constant: top)
        }
        if let leading = leading {
            constraintManager.leading = leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading)
        }
        if let bottom = bottom {
            constraintManager.bottom = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom)
        }
        if let trailing = trailing {
            constraintManager.trailing = trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing)
        }
        [constraintManager.leading, constraintManager.trailing, constraintManager.top, constraintManager.bottom].forEach { $0?.isActive = true }
        return constraintManager
    }
    
    /// Pin to view based on insets values. Nil properties within ConstraintEdgeInsets will not apply constraints.
    ///
    /// - Parameters:
    ///   - view: UIView to to apply constraints with
    ///   - insets: ConstraintEdgeInsets to apply
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func pin(view: UIView, insets: ConstraintEdgeInsets) -> ConstraintManager {
        return pin(view: view, top: insets.top, leading: insets.leading, bottom: insets.bottom, trailing: insets.trailing)
    }
    
    // MARK: - Size
    
    /// Apply width anchor to calling view with a specified constant
    ///
    /// - Parameter constant: Constant value to apply upon constraint
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func anchorWidth(constant: CGFloat) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        let constraintManager = ConstraintManager()
        constraintManager.width = widthAnchor.constraint(equalToConstant: constant)
        constraintManager.width?.isActive = true
        return constraintManager
    }
    
    /// Apply width anchor between calling view and argument view with specified multiplier and constant
    /// - Parameters:
    ///   - view: UIView to apply constraint with
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func anchorWidth(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        let constraintManager = ConstraintManager()
        constraintManager.width = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier, constant: constant)
        constraintManager.width?.isActive = true
        return constraintManager
    }
    
    /**
     Anchor width relative to superview based on multipler & constant
     
     - parameter multiplier: multiplier constant for the constraint.
     - parameter constant: offset constant for this relationship.
     - returns: An NSLayoutConstraint object that defines the attribute represented by this layout anchor as equal to the attribute represented by the anchor parameter multiplied by the m constant plus the constant c
     */
    
    
    /// Apply width anchor between calling view and superview with specified multiplier and constant
    ///
    /// - Parameters:
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func anchorWidthToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0) -> ConstraintManager {
        guard let superview = superview else {
            return ConstraintManager()
        }
        return anchorWidth(view: superview, multiplier: multiplier, constant: constant)
    }
    
    /// Apply height anchor to calling view with a specified constant
    ///
    /// - Parameter constant: Constant value to apply upon constraint
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func anchorHeight(constant: CGFloat = 0) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        var constraintManager = ConstraintManager()
        constraintManager.height = heightAnchor.constraint(equalToConstant: constant)
        constraintManager.height?.isActive = true
        return constraintManager
    }
    
    /// Apply height anchor between calling view and argument view with specified multiplier and constant
    /// - Parameters:
    ///   - view: UIView to apply constraint with
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func anchorHeight(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        let constraintManager =  ConstraintManager()
        constraintManager.height = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier, constant: constant)
        constraintManager.height?.isActive = true
        return constraintManager
    }
    
    /// Apply height anchor between calling view and superview with specified multiplier and constant
    ///
    /// - Parameters:
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func anchorHeightToSuperview(multiplier: CGFloat = 0, constant: CGFloat = 0) -> ConstraintManager {
        guard let superview = superview else {
            return ConstraintManager()
        }
        return anchorHeight(view: superview, multiplier: multiplier, constant: constant)
    }
    
    /// Anchor size relative to superview based on CGSize given. Applies width anchor and height anchor
    ///
    /// - Parameter size: CGSize specifying width and height
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func anchorSizeToSuperview(_ size: CGSize) -> ConstraintManager {
        return anchorWidthToSuperview(multiplier: size.width)
            .append(anchorHeightToSuperview(multiplier: size.height))
    }
    
    /// Anchor size relative to specified view. Applies width anchor and height anchor
    ///
    /// - Parameter size: CGSize specifying width and height
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func anchorSize(view: UIView) -> ConstraintManager {
        return anchorWidth(view: view).append(anchorHeight(view: view))
    }
    
    /// Anchor size by applying width anchor and height anchor
    ///
    /// - Parameter size: CGSize specifying width and height
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func anchorSize(size: CGSize) -> ConstraintManager {
        return anchorWidth(constant: size.width)
            .append(anchorHeight(constant: size.height))
    }
    
    // MARK: - Snap Horizontally/Vertically
    
    /// Applies necessary constraint to ensure calling view will be leading view and the trailingView is on the trailing side.
    /// Initalizes trailing property of ConstraintManager
    /// - Parameters:
    ///   - trailingView: View who will be shown as the trailingView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func snapHorizontally(trailingView: UIView, constant: CGFloat = 0) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        let constraintManager = ConstraintManager()
        constraintManager.trailing = trailingAnchor.constraint(equalTo: trailingView.leadingAnchor, constant: constant)
        constraintManager.trailing?.isActive = true
        return constraintManager
    }
    
    /// Applies necessary constraint to ensure calling view will be trailing and the leadingView is on the leading side.
    /// Initalizes trailing property of ConstraintManager
    /// - Parameters:
    ///   - leadingView: View who will be shown as the leadingView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func snapHorizontally(leadingView: UIView, constant: CGFloat = 0) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        let constraintManager = ConstraintManager()
        constraintManager.leading = leadingAnchor.constraint(equalTo: leadingView.trailingAnchor, constant: constant)
        constraintManager.leading?.isActive = true
        return constraintManager
    }
    
    /// Applies necessary constraint to ensure calling view will be top view and the bottom view will be bottom view
    /// Initalizes bottom property of ConstraintManager
    /// - Parameters:
    ///   - bottomView: View who will be shown as the bottomView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func snapVertically(bottomView: UIView, constant: CGFloat = 0) -> ConstraintManager {
        let constraintManager = ConstraintManager()
        constraintManager.bottom = bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: constant)
        constraintManager.bottom?.isActive = true
        return constraintManager
    }
    
    /// Applies necessary constraint to ensure calling view will be bottom view and the top view will be top view
    ///
    /// - Parameters:
    ///   - topView: View who will be shown as the bottomView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func snapVertically(topView: UIView, constant: CGFloat = 0) -> ConstraintManager {
        let constraintManager = ConstraintManager()
        constraintManager.top = topAnchor.constraint(equalTo: topView.bottomAnchor, constant: constant)
        constraintManager.top?.isActive = true
        return constraintManager
    }
    
    // MARK: - Align
    
    /// Center constraints relative to another view based on axis parameters and offset provided
    ///
    /// - Parameters:
    ///   - axis: Specfies which or all alignments to apply constraints
    ///   - toView: View to apply constraints with
    ///   - offset: Offset to apply with
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func align(_ axis: ConstraintAxis, toView: UIView, offset: UIOffset = .zero) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        var constraintManager = ConstraintManager()
        if axis == .centerXAndY || axis == .centerX {
            constraintManager.centerX = centerXAnchor.constraint(equalTo: toView.centerXAnchor, constant: offset.horizontal)
        }
        if axis == .centerXAndY || axis == .centerY {
            constraintManager.centerY = centerYAnchor.constraint(equalTo: toView.centerYAnchor, constant: offset.vertical)
        }
        [constraintManager.centerX, constraintManager.centerY].forEach { $0?.isActive = true }
        return constraintManager
    }
    
    /// Center constraints relative to superview based on axis parameters and offset provided
    ///
    /// - Parameters:
    ///   - axis: Specfies which or all alignments to apply constraints
    ///   - offset: Offset to apply with
    /// - Returns: ConstraintManager holding all the values associated with constraints
    func alignToSuperView(_ axis: ConstraintAxis, offset: UIOffset = .zero) -> ConstraintManager {
        guard let superview = superview else {
            return ConstraintManager()
        }
        return align(axis, toView: superview)
    }
}
