//
//  SnapLayout.swift
//  Pods
//
//  Created by Satinder Singh on 10/2/16.
//
//

/// Extension Methods for convenience
public extension UIView {
    
    /// Snap to view based on argument values.
    /// - Warning: Since all parameters have default values, it is possible to call `snap()` with no parameters.
    /// This is **strongly** discouraged.
    ///
    /// - Parameters:
    ///   - view: UIView to to apply constraints with (defaulted to superview if nil)
    ///   - top: Constant to apply to top constraint from topAnchor (if nil, not applied)
    ///   - leading: Constant to apply from leadingAnchor  (if nil, not applied)
    ///   - bottom: Constant to apply from bottomAnchor  (if nil, not applied)
    ///   - trailing: Constant to apply from trailingAnchor  (if nil, not applied)
    ///   - width: Constant to apply from widthAnchor  (if nil, not applied)
    ///   - height: Constant to apply from heightAnchor  (if nil, not applied)
    ///   - centerX: Constant offset to apply from centerXAnchor  (if nil, not applied)
    ///   - centerY: Constant offset to apply from centerXAnchor  (if nil, not applied)
    /// - Note: width and height are not in respect to superview, but always to self
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(to view: UIView? = nil, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil,
              trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil, centerX: CGFloat? = nil,
              centerY: CGFloat? = nil) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        var snapManager = SnapManager(view: self)
        if let width = width {
            snapManager.width = widthAnchor.constraint(equalToConstant: width)
            snapManager.width?.isActive = true
        }
        if let height = height {
            snapManager.height = heightAnchor.constraint(equalToConstant: height)
            snapManager.height?.isActive = true
        }
        guard let view = view ?? superview else {
            if snapManager.width == nil && snapManager.height == nil {
                print("SnapLayout Error - No constraint was applied for view: \(String(describing: self))")
            }
            return snapManager
        }
        if let top = top {
            snapManager.top = topAnchor.constraint(equalTo: view.topAnchor, constant: top)
            snapManager.top?.isActive = true
        }
        if let leading = leading {
            snapManager.leading = leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading)
            snapManager.leading?.isActive = true
        }
        if let bottom = bottom {
            snapManager.bottom = view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom)
            snapManager.bottom?.isActive = true
        }
        if let trailing = trailing {
            snapManager.trailing = view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing)
            snapManager.trailing?.isActive = true
        }
        if let centerX = centerX {
            snapManager.centerX = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerX)
            snapManager.centerX?.isActive = true
        }
        if let centerY = centerY {
            snapManager.centerY = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerY)
            snapManager.centerY?.isActive = true
        }
        let inActiveCount = [snapManager.width, snapManager.height, snapManager.top, snapManager.leading,
                           snapManager.bottom, snapManager.trailing, snapManager.centerX,
                           snapManager.centerY].filter ({ $0?.isActive == true }).count
        if inActiveCount == 0 {
            print("SnapLayout Error - No constraint was applied for view: \(String(describing: view))")
        }
        return snapManager
    }
    
    /// Snap to view based on argument values.
    /// Nil properties within ConstraintConstants will not apply constraints.
    ///
    /// - Parameters:
    ///   - view: UIView to to apply constraints with (defaulted to superview if nil)
    ///   - constants: ConstraintConstants to apply
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(to view: UIView? = nil, constants: SnapConfig) -> SnapManager {
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
    func snapWidth(to view: UIView, multiplier: CGFloat = 1) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.width = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)
        snapManager.width?.isActive = true
        return snapManager
    }
    
    /// Apply height anchor between calling view and argument view with specified multiplier
    ///
    /// - Parameters:
    ///   - view: UIView to apply constraint with (defaulted to superview if nil)
    ///   - multiplier: Multiplier value to apply constraint with (default 1)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snapHeight(to view: UIView, multiplier: CGFloat = 1) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.height = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        snapManager.height?.isActive = true
        return snapManager
    }
    
    /// Anchor size by applying width anchor and height anchor
    ///
    /// - Parameter size: CGSize specifying width and height
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(size: CGSize) -> SnapManager {
        return snap(width: size.width, height: size.height)
    }
    
    /// Applies necessary constraint to ensure calling view will be leading view and the trailingView is on the trailing side.
    /// Initalizes trailing property of SnapManager
    /// - Parameters:
    ///   - trailingView: View who will be shown as the trailingView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(trailingView: UIView, constant: CGFloat = 0) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.trailing = trailingView.leadingAnchor.constraint(equalTo: trailingAnchor, constant: constant)
        snapManager.trailing?.isActive = true
        return snapManager
    }
    
    /// Applies necessary constraint to ensure calling view will be trailing and the leadingView is on the leading side.
    /// Initalizes trailing property of SnapManager
    /// - Parameters:
    ///   - leadingView: View who will be shown as the leadingView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(leadingView: UIView, constant: CGFloat = 0) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.leading = leadingAnchor.constraint(equalTo: leadingView.trailingAnchor, constant: constant)
        snapManager.leading?.isActive = true
        return snapManager
    }
    
    /// Applies necessary constraint to ensure calling view will be top view and the bottom view will be bottom view
    /// Initalizes bottom property of SnapManager
    /// - Parameters:
    ///   - bottomView: View who will be shown as the bottomView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(bottomView: UIView, constant: CGFloat = 0) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.bottom = bottomView.topAnchor.constraint(equalTo: bottomAnchor, constant: constant)
        snapManager.bottom?.isActive = true
        return snapManager
    }
    
    /// Applies necessary constraint to ensure calling view will be bottom view and the top view will be top view
    ///
    /// - Parameters:
    ///   - topView: View who will be shown as the bottomView
    ///   - constant: Constant value to apply constraint with (default 0)
    /// - Returns: SnapManager holding all the values associated with constraints
    @discardableResult
    func snap(topView: UIView, constant: CGFloat = 0) -> SnapManager {
        translatesAutoresizingMaskIntoConstraints = false
        let snapManager = SnapManager(view: self)
        snapManager.top = topAnchor.constraint(equalTo: topView.bottomAnchor, constant: constant)
        snapManager.top?.isActive = true
        return snapManager
    }
    
}
