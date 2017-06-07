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
    fileprivate weak var weakView: View?

    /// Initalizes SnapManager with all properties set to nil
    fileprivate init() {}

    /// Initalizes the view property within `SnapManager` which allows for chaining to occur
    internal init(view: View) {
        self.weakView = view
    }

    /// Snap to view based on argument values.
    /// - Warning: Since all parameters have default values, it is possible to call `snap()` with no parameters. 
    /// This is **strongly** discouraged.
    ///
    /// - Parameters:
    ///   - view: View to to apply constraints with (defaulted to superview if nil)
    ///   - top: Constant to apply to top constraint from topAnchor (if nil, not applied)
    ///   - leading: Constant to apply from leadingAnchor  (if nil, not applied)
    ///   - bottom: Constant to apply from bottomAnchor  (if nil, not applied)
    ///   - trailing: Constant to apply from trailingAnchor  (if nil, not applied)
    ///   - width: Constant to apply from widthAnchor  (if nil, not applied)
    ///   - height: Constant to apply from heightAnchor  (if nil, not applied)
    ///   - centerX: Boolean determining if centerX should be applied  (if nil, not applied)
    ///   - centerY: Boolean determining if centerY should be applied  (if nil, not applied)
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Note: width and height are not in respect to superview, but always to self.
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(to view: View? = nil, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil,
                     trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil, centerX: CGFloat? = nil,
                     centerY: CGFloat? = nil, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        guard let weakView = weakView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        let newSnapManager = weakView.snap(to: view,
                                           top: top,
                                           leading: leading,
                                           bottom: bottom,
                                           trailing: trailing,
                                           width: width,
                                           height: height,
                                           centerX: centerX,
                                           centerY: centerY,
                                           priority: priority,
                                           isActive: isActive)
        sync(with: newSnapManager)
        return self
    }

    /// Snap to view based on argument values.
    /// nil properties within SnapConfig will not apply constraints.
    ///
    /// - Parameters:
    ///   - view: View to to apply constraints with (defaulted to superview if nil)
    ///   - config: SnapConfig to apply
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(to view: View? = nil, config: SnapConfig, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        return snap(to: view,
                    top: config.top,
                    leading: config.leading,
                    bottom: config.bottom,
                    trailing: config.trailing,
                    width: config.width,
                    height: config.height,
                    centerX: config.centerX,
                    centerY: config.centerY,
                    priority: priority,
                    isActive: isActive)
    }
    
    /// Apply width anchor between calling view and argument view with specified multiplier
    ///
    /// - Parameters:
    ///   - view: View to apply constraint with (defaulted to superview if nil)
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snapWidth(to view: View, multiplier: CGFloat = 1, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        guard let weakView = weakView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        let newSnapManager = weakView.snapWidth(to: view, multiplier: multiplier, priority: priority, isActive: isActive)
        sync(with: newSnapManager)
        return self
    }
    
    /// Apply height anchor between calling view and argument view with specified multiplier
    ///
    /// - Parameters:
    ///   - view: View to apply constraint with (defaulted to superview if nil)
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snapHeight(to view: View, multiplier: CGFloat = 1, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        guard let weakView = weakView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        let newSnapManager = weakView.snapHeight(to: view, multiplier: multiplier, priority: priority, isActive: isActive)
        sync(with: newSnapManager)
        return self
    }
    
    /// Anchor size by applying width anchor and height anchor
    ///
    /// - Parameter size: CGSize specifying width and height
    /// - Parameter isActive: Boolean determining if constraint should be activated (default true)
    /// - Parameter priority: LayoutPriority to apply upon constraint (default required)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(size: CGSize, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        guard let weakView = weakView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        let newSnapManager = weakView.snap(size: size, priority: priority, isActive: isActive)
        sync(with: newSnapManager)
        return self
    }
    
    /// Applies necessary constraint to ensure calling view will be leading view and the trailingView is on the trailing side.
    /// Initalizes trailing property of SnapManager
    /// - Parameters:
    ///   - trailingView: View who will be shown as the trailingView
    ///   - constant: Constant value to apply constraint with (default 0)
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(trailingView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        guard let weakView = weakView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        let newSnapManager = weakView.snap(trailingView: trailingView, constant: constant, priority: priority, isActive: isActive)
        sync(with: newSnapManager)
        return self
    }
    
    /// Applies necessary constraint to ensure calling view will be trailing and the leadingView is on the leading side.
    /// Initalizes trailing property of SnapManager
    /// - Parameters:
    ///   - leadingView: View who will be shown as the leadingView
    ///   - constant: Constant value to apply constraint with (default 0)
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(leadingView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        guard let weakView = weakView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        let newSnapManager = weakView.snap(leadingView: leadingView, constant: constant, priority: priority, isActive: isActive)
        sync(with: newSnapManager)
        return self
    }
    
    /// Applies necessary constraint to ensure calling view will be top view and the bottom view will be bottom view
    /// Initalizes bottom property of SnapManager
    /// - Parameters:
    ///   - bottomView: View who will be shown as the bottomView
    ///   - constant: Constant value to apply constraint with (default 0)
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(bottomView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        guard let weakView = weakView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        let newSnapManager = weakView.snap(bottomView: bottomView, constant: constant, priority: priority, isActive: isActive)
        sync(with: newSnapManager)
        return self
    }
    
    /// Applies necessary constraint to ensure calling view will be bottom view and the top view will be top view
    ///
    /// - Parameters:
    ///   - topView: View who will be shown as the bottomView
    ///   - constant: Constant value to apply constraint with (default 0)
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    public func snap(topView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        guard let weakView = weakView else {
            print("SnapLayout Error - Cannot apply constraint upon a view that is not retained")
            return SnapManager()
        }
        let newSnapManager = weakView.snap(topView: topView, constant: constant, priority: priority, isActive: isActive)
        sync(with: newSnapManager)
        return self
    }
    
    /// Syncs two snapManagers together to ensure constraints are propogated between snapManagers.
    /// Constraints from the other snapManager will update self's properties if non-nil.
    /// - Note: other SnapManager will always take precedence over self's constraints.
    ///
    /// - Parameter other: SnapManager to update self with
    fileprivate func sync(with other: SnapManager) {
        top = other.top ?? top
        leading = other.leading ?? leading
        bottom = other.bottom ?? bottom
        trailing = other.trailing ?? trailing
        width = other.width ?? width
        height = other.height ?? height
        centerX = other.centerX ?? centerX
        centerY = other.centerY ?? centerY
    }

}
