//
//  SnapLayout.swift
//  Pods
//
//  Created by Satinder Singh on 10/2/16.
//
//

/// Extension Methods for convenience
public extension View {
    
    /// Snap to view based on argument values.
    /// - Warning: Since all parameters have default values, it is possible to call `snap()` with no parameters.
    /// This is **strongly** discouraged.
    /// - Parameters:
    ///   - view: View to to apply constraints with (defaulted to superview if nil)
    ///   - top: Constant to apply to top constraint from topAnchor (if nil, not applied)
    ///   - leading: Constant to apply from leadingAnchor  (if nil, not applied)
    ///   - bottom: Constant to apply from bottomAnchor  (if nil, not applied)
    ///   - trailing: Constant to apply from trailingAnchor  (if nil, not applied)
    ///   - width: Constant to apply from widthAnchor  (if nil, not applied)
    ///   - height: Constant to apply from heightAnchor  (if nil, not applied)
    ///   - centerX: Constant offset to apply from centerXAnchor  (if nil, not applied)
    ///   - centerY: Constant offset to apply from centerXAnchor  (if nil, not applied)
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Note: width and height are not in respect to superview, but always to self.
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(to view: View? = nil, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil,
              trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil, centerX: CGFloat? = nil,
              centerY: CGFloat? = nil, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        var snapManager = SnapManager(view: self)
        var constraintList = [NSLayoutConstraint]()
        defer {
            constraintList.forEach { $0.priority = priority }
            if constraintList.count == 0 {
                Swift.print("SnapLayout Error - No constraint was applied for view: \(String(describing: view))")
            } else if isActive {
                NSLayoutConstraint.activate(constraintList)
            }
        }
        if let width = width {
            let constraint = os_anchors.widthAnchor.constraint(equalToConstant: width)
            snapManager.width = constraint
            constraintList.append(constraint)
        }
        if let height = height {
            let constraint = os_anchors.heightAnchor.constraint(equalToConstant: height)
            snapManager.height = constraint
            constraintList.append(constraint)
        }
        guard let view = view ?? superview else {
            return snapManager
        }
        if let top = top {
            let constraint = topAnchor.constraint(equalTo: view.os_anchors.topAnchor, constant: top)
            snapManager.top = constraint
            constraintList.append(constraint)
        }
        if let leading = leading {
            let constraint = leadingAnchor.constraint(equalTo: view.os_anchors.leadingAnchor, constant: leading)
            snapManager.leading = constraint
            constraintList.append(constraint)
        }
        if let bottom = bottom {
            let constraint = view.os_anchors.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom)
            snapManager.bottom = constraint
            constraintList.append(constraint)
        }
        if let trailing = trailing {
            let constraint = view.os_anchors.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing)
            snapManager.trailing = constraint
            constraintList.append(constraint)
        }
        if let centerX = centerX {
            let constraint = centerXAnchor.constraint(equalTo: view.os_anchors.centerXAnchor, constant: centerX)
            snapManager.centerX = constraint
            constraintList.append(constraint)
        }
        if let centerY = centerY {
            let constraint = centerYAnchor.constraint(equalTo: view.os_anchors.centerYAnchor, constant: centerY)
            snapManager.centerY = constraint
            constraintList.append(constraint)
        }
        return snapManager
    }
    
    /// Snap to view based on argument values.
    /// Nil properties within ConstraintConstants will not apply constraints.
    ///
    /// - Parameters:
    ///   - view: View to to apply constraints with (defaulted to superview if nil)
    ///   - config: SnapConfig to apply
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(to view: View? = nil, config: SnapConfig, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
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
    func snapWidth(to view: View, multiplier: CGFloat = 1, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.width = widthAnchor.constraint(equalTo: view.os_anchors.widthAnchor, multiplier: multiplier)
        snapManager.width?.priority = priority
        snapManager.width?.isActive = isActive
        return snapManager
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
    func snapHeight(to view: View, multiplier: CGFloat = 1, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.height = heightAnchor.constraint(equalTo: view.os_anchors.heightAnchor, multiplier: multiplier)
        snapManager.height?.priority = priority
        snapManager.height?.isActive = isActive
        return snapManager
    }
    
    /// Anchor size by applying width anchor and height anchor
    ///
    /// - Parameters:
    ///   - size: CGSize specifying width and height
    ///   - isActive: Boolean determining if constraint should be activated (default true)
    ///   - priority: LayoutPriority to apply upon constraint (default required)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(size: CGSize, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        return snap(width: size.width, height: size.height, priority: priority, isActive: isActive)
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
    func snap(trailingView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.trailing = trailingView.os_anchors.leadingAnchor.constraint(equalTo: trailingAnchor, constant: constant)
        snapManager.trailing?.priority = priority
        snapManager.trailing?.isActive = isActive
        return snapManager
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
    func snap(leadingView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.leading = leadingAnchor.constraint(equalTo: leadingView.os_anchors.trailingAnchor, constant: constant)
        snapManager.leading?.priority = priority
        snapManager.leading?.isActive = isActive
        return snapManager
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
    func snap(bottomView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.bottom = bottomView.os_anchors.topAnchor.constraint(equalTo: bottomAnchor, constant: constant)
        snapManager.bottom?.priority = priority
        snapManager.bottom?.isActive = isActive
        return snapManager
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
    func snap(topView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.top = topAnchor.constraint(equalTo: topView.os_anchors.bottomAnchor, constant: constant)
        snapManager.top?.priority = priority
        snapManager.top?.isActive = isActive
        return snapManager
    }
    
}
