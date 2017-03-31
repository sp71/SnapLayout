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
    
}
