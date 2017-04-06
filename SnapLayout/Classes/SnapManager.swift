//
//  SnapManager.swift
//  Pods
//
//  Created by Satinder Singh on 3/28/17.
//
//

/// Holds individual `NSLayoutConstraint` instance through properties applied to view
public class SnapManager {

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

    /// Internal reference to view
    fileprivate weak var selfView: UIView?

    /// Initalizes SnapManager with all properties set to nil
    internal init() {}

    /// Initalizes the view property within `SnapManager` which allows for chaining to occur
    internal init(view: UIView) {
        self.selfView = view
    }

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
    ///   - centerX: Boolean determining if centerX should be applied  (if nil, not applied)
    ///   - centerY: Boolean determining if centerY should be applied  (if nil, not applied)
    /// - Note: width and height are not in respect to superview, but always to self.
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(to view: UIView? = nil, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil,
                     trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil, centerX: Bool? = nil,
                     centerY: Bool? = nil) -> SnapManager {
        guard let selfView = selfView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        return selfView.snap(to: view,
                             top: top,
                             leading: leading,
                             bottom: bottom,
                             trailing: trailing,
                             width: width,
                             height: height,
                             centerX: centerX,
                             centerY: centerY)
    }

    /// Snap to view based on argument values.
    /// Nil properties within ConstraintConstants will not apply constraints.
    ///
    /// - Parameters:
    ///   - view: UIView to to apply constraints with (defaulted to superview if nil)
    ///   - constants: ConstraintConstants to apply
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(to view: UIView? = nil, constants: SnapConfig) -> SnapManager {
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
    
    /// Apply width anchor between calling view and argument view with specified multiplier
    ///
    /// - Parameters:
    ///   - view: UIView to apply constraint with (defaulted to superview if nil)
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snapWidth(to view: UIView? = nil, multiplier: CGFloat = 1) -> SnapManager {
        guard let selfView = selfView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        return selfView.snapWidth(to: view, multiplier: multiplier)
    }
    
    /// Apply height anchor between calling view and argument view with specified multiplier
    ///
    /// - Parameters:
    ///   - view: UIView to apply constraint with (defaulted to superview if nil)
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snapHeight(to view: UIView? = nil, multiplier: CGFloat = 1) -> SnapManager {
        guard let selfView = selfView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        return selfView.snapHeight(to: view, multiplier: multiplier)
    }
    
    /// Anchor size by applying width anchor and height anchor
    ///
    /// - Parameter size: CGSize specifying width and height
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snapSize(size: CGSize) -> SnapManager {
        guard let selfView = selfView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        return selfView.snapSize(size: size)
    }
    
    /// Applies necessary constraint to ensure calling view will be leading view and the trailingView is on the trailing side.
    /// Initalizes trailing property of SnapManager
    /// - Parameters:
    ///   - trailingView: View who will be shown as the trailingView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(trailingView: UIView, constant: CGFloat = 0) -> SnapManager {
        guard let selfView = selfView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        return selfView.snap(trailingView: trailingView, constant: constant)
    }
    
    /// Applies necessary constraint to ensure calling view will be trailing and the leadingView is on the leading side.
    /// Initalizes trailing property of SnapManager
    /// - Parameters:
    ///   - leadingView: View who will be shown as the leadingView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(leadingView: UIView, constant: CGFloat = 0) -> SnapManager {
        guard let selfView = selfView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        return selfView.snap(leadingView: leadingView, constant: constant)
    }
    
    /// Applies necessary constraint to ensure calling view will be top view and the bottom view will be bottom view
    /// Initalizes bottom property of SnapManager
    /// - Parameters:
    ///   - bottomView: View who will be shown as the bottomView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(bottomView: UIView, constant: CGFloat = 0) -> SnapManager {
        guard let selfView = selfView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        return selfView.snap(bottomView: bottomView, constant: constant)
    }
    
    /// Applies necessary constraint to ensure calling view will be bottom view and the top view will be top view
    ///
    /// - Parameters:
    ///   - topView: View who will be shown as the bottomView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(topView: UIView, constant: CGFloat = 0) -> SnapManager {
        guard let selfView = selfView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        return selfView.snap(topView: topView, constant: constant)
    }

}
