//
//  SnapLayout.swift
//  Pods
//
//  Created by Satinder Singh on 10/2/16.
//
//

/// Constants to apply to each Constraint
public struct ConstraintConstants {
    
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
    
    /// Value associated with centerX constraint. Constraint only applied if true.
    public var centerX: Bool?
    
    /// Value associated with centerY constraint. Constraint only applied if true.
    public var centerY: Bool?

    /// Constant value associated with zero for top, leading, bottom, and trailing. 
    /// No width nor height nor centerX not centerY constraint is applied.
    public static let zero = ConstraintConstants(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    public init(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil,
                trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil,
                centerX: Bool? = nil, centerY: Bool? = nil) {
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

/// Manages Constraints for View
public class ConstraintManager {
    
    /// Top Constraint
    public var top: NSLayoutConstraint?

    /// Leading Constraint
    public var leading: NSLayoutConstraint?
    
    /// Bottom Constraint
    public var bottom: NSLayoutConstraint?
    
    /// Trailing Constraint
    public var trailing: NSLayoutConstraint?
    
    /// Width Constraint
    public var width: NSLayoutConstraint?
    
    /// Height Constraint
    public var height: NSLayoutConstraint?
    
    /// Center X Constraint
    public var centerX: NSLayoutConstraint?
    
    /// Center Y Constraint
    public var centerY: NSLayoutConstraint?
    
    /// Initalizes ConstraintManager with all properties set to nil
    public init() {}
    
    /// Update Constraint Manager with specified constraint manager argument
    /// All properties from argument object will override to the calling constraint manager
    ///
    /// - Parameter otherCM: Other Constraint Manager to update calling constraint manager properties with
    @discardableResult
    public func append(_ otherCM: ConstraintManager) -> ConstraintManager {
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
    
    /// Snap to view based on argument values.
    ///
    /// - Parameters:
    ///   - view: UIView to to apply constraints with (defaulted to superview if nil)
    ///   - top: Constant to apply to top constraint from topAnchor (if nil, not applied)
    ///   - leading: Constant to apply from leadingAnchor  (if nil, not applied)
    ///   - bottom: Constant to apply from bottomAnchor  (if nil, not applied)
    ///   - trailing: Constant to apply from trailingAnchor  (if nil, not applied)
    ///   - width: Constant to apply from widthAnchor  (if nil, not applied)
    ///   - height: Constant to apply from heightAnchor  (if nil, not applied)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    @discardableResult
    func snap(to view: UIView? = nil, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil,
              trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil, centerX: Bool? = nil,
              centerY: Bool? = nil) -> ConstraintManager {
        guard let view = view ?? superview else { return ConstraintManager() }
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
        if let width = width {
            constraintManager.width = widthAnchor.constraint(equalToConstant: width)
        }
        if let height = height {
            constraintManager.height = heightAnchor.constraint(equalToConstant: height)
        }
        if let centerX = centerX, centerX {
            constraintManager.centerX = centerXAnchor.constraint(equalTo: view.centerXAnchor)
        }
        if let centerY = centerY, centerY {
            constraintManager.centerY = centerYAnchor.constraint(equalTo: view.centerYAnchor)
        }
        [constraintManager.top, constraintManager.leading, constraintManager.bottom, constraintManager.trailing,
         constraintManager.width, constraintManager.height, constraintManager.centerX, constraintManager.centerY].forEach { $0?.isActive = true }
        return constraintManager
    }
    
    /// Snap to view based on argument values.
    /// Nil properties within ConstraintConstants will not apply constraints.
    ///
    /// - Parameters:
    ///   - view: UIView to to apply constraints with (defaulted to superview if nil)
    ///   - constants: ConstraintConstants to apply
    /// - Returns: ConstraintManager holding all the values associated with constraints
    @discardableResult
    func snap(to view: UIView? = nil, constants: ConstraintConstants) -> ConstraintManager {
        return snap(to: view,
                    top: constants.top,
                    leading: constants.leading,
                    bottom: constants.bottom,
                    trailing: constants.trailing,
                    width: constants.width,
                    height: constants.height,
                    centerX: constants.centerX,
                    centerY: constants.centerY)
    }
    
    /// Apply width anchor to calling view with a specified constant
    ///
    /// - Parameter constant: Constant value to apply upon constraint
    /// - Returns: ConstraintManager holding all the values associated with constraints
    @discardableResult
    func snapWidth(constant: CGFloat) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        let constraintManager = ConstraintManager()
        constraintManager.width = widthAnchor.constraint(equalToConstant: constant)
        constraintManager.width?.isActive = true
        return constraintManager
    }
    
    /// Apply width anchor between calling view and argument view with specified multiplier
    ///
    /// - Parameters:
    ///   - view: UIView to apply constraint with (defaulted to superview if nil)
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    @discardableResult
    func snapWidth(to view: UIView? = nil, multiplier: CGFloat = 1) -> ConstraintManager {
        guard let view = view ?? superview else { return ConstraintManager() }
        translatesAutoresizingMaskIntoConstraints = false
        let constraintManager = ConstraintManager()
        constraintManager.width = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)
        constraintManager.width?.isActive = true
        return constraintManager
    }
    
    /// Apply height anchor to calling view with a specified constant
    ///
    /// - Parameter constant: Constant value to apply upon constraint
    /// - Returns: ConstraintManager holding all the values associated with constraints
    @discardableResult
    func snapHeight(constant: CGFloat) -> ConstraintManager {
        translatesAutoresizingMaskIntoConstraints = false
        var constraintManager = ConstraintManager()
        constraintManager.height = heightAnchor.constraint(equalToConstant: constant)
        constraintManager.height?.isActive = true
        return constraintManager
    }
    
    /// Apply height anchor between calling view and argument view with specified multiplier
    ///
    /// - Parameters:
    ///   - view: UIView to apply constraint with (defaulted to superview if nil)
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    @discardableResult
    func snapHeight(to view: UIView? = nil, multiplier: CGFloat = 1) -> ConstraintManager {
        guard let view = view ?? superview else { return ConstraintManager() }
        translatesAutoresizingMaskIntoConstraints = false
        let constraintManager =  ConstraintManager()
        constraintManager.height = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        constraintManager.height?.isActive = true
        return constraintManager
    }
    
    /// Anchor size by applying width anchor and height anchor
    ///
    /// - Parameter size: CGSize specifying width and height
    /// - Returns: ConstraintManager holding all the values associated with constraints
    @discardableResult
    func snapSize(size: CGSize) -> ConstraintManager {
        return snapWidth(constant: size.width)
            .append(snapHeight(constant: size.height))
    }
    
    // MARK: - Snap Horizontally/Vertically
    
    /// Applies necessary constraint to ensure calling view will be leading view and the trailingView is on the trailing side.
    /// Initalizes trailing property of ConstraintManager
    /// - Parameters:
    ///   - trailingView: View who will be shown as the trailingView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: ConstraintManager holding all the values associated with constraints
    @discardableResult
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
    @discardableResult
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
    @discardableResult
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
    @discardableResult
    func snapVertically(topView: UIView, constant: CGFloat = 0) -> ConstraintManager {
        let constraintManager = ConstraintManager()
        constraintManager.top = topAnchor.constraint(equalTo: topView.bottomAnchor, constant: constant)
        constraintManager.top?.isActive = true
        return constraintManager
    }
    
}
