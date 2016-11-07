//
//  SnapLayout.swift
//  Pods
//
//  Created by Satinder Singh on 10/2/16.
//
//

///  Defines Axis alignment to be used
public enum Axis {
    /// Center only the X axis
    case CenterX
    
    /// Center only the Y axis
    case CenterY
    
    /// Center the X and Y axis
    case CenterXAndY
}

public extension UIView {
    
    /**
     Pin to superview based on specified edges. Inset values are applied to specified edges only. Unspecified edges are not constrained.
     - parameter edges: Constraints are applied to the edges provided
     - parameter insets: Insets to apply to given edges (defaulted to UIEdgeInsetsZero)
     - returns: List of NSLayoutConstraints applied to view in the following order if applied: Left, Right, Top, Bottom
     */
    func pinToSuperview(edges: UIRectEdge, insets: UIEdgeInsets = UIEdgeInsetsZero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraintList = [NSLayoutConstraint]()
        guard let superview = superview else { return constraintList }
        if edges.contains(.All) || edges.contains(.Left) {
            constraintList.append(leadingAnchor.constraintEqualToAnchor(superview.leadingAnchor, constant: insets.left))
        }
        if edges.contains(.All) || edges.contains(.Right) {
            constraintList.append(trailingAnchor.constraintEqualToAnchor(superview.trailingAnchor, constant: insets.right))
        }
        if edges.contains(.All) || edges.contains(.Top) {
            constraintList.append(topAnchor.constraintEqualToAnchor(superview.topAnchor, constant: insets.top))
        }
        if edges.contains(.All) || edges.contains(.Bottom) {
            constraintList.append(bottomAnchor.constraintEqualToAnchor(superview.bottomAnchor, constant: insets.bottom))
        }
        constraintList.forEach { $0.active = true }
        return constraintList
    }
    
    /**
     Pin to superview's leading and trailing margin guide
     - returns: List of NSLayoutConstraints applied to view in the following order: leadingAnchor, trailingAnchor
     */
    func pinToSuperViewSideMarginGuides() -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraintList = [NSLayoutConstraint]()
        guard let superview = superview else { return constraintList }
        constraintList.append(leadingAnchor.constraintEqualToAnchor(superview.layoutMarginsGuide.leadingAnchor))
        constraintList.append(trailingAnchor.constraintEqualToAnchor(superview.layoutMarginsGuide.trailingAnchor))
        constraintList.forEach { $0.active = true }
        return constraintList
    }
    
    /**
     Anchor height relative to superview based on multipler & constant
     
     - parameter multiplier: multiplier constant for the constraint.
     - parameter constant: offset constant for this relationship.
     - returns: An NSLayoutConstraint object that defines the attribute represented by this layout anchor as equal to the attribute represented by the anchor parameter multiplied by the m constant plus the constant c
     */
    func anchorHeightToSuperview(multiplier multiplier: CGFloat = 0, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        assert(superview != nil, "superview cannot be nil")
        let constraint = heightAnchor.constraintEqualToAnchor(superview!.heightAnchor, multiplier: multiplier, constant: constant)
        constraint.active = true
        return constraint
    }
    
    /**
     Anchor width relative to superview based on multipler & constant
     
     - parameter multiplier: multiplier constant for the constraint.
     - parameter constant: offset constant for this relationship.
     - returns: An NSLayoutConstraint object that defines the attribute represented by this layout anchor as equal to the attribute represented by the anchor parameter multiplied by the m constant plus the constant c
     */
    func anchorWidthToSuperview(multiplier multiplier: CGFloat, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        assert(superview != nil, "superview cannot be nil")
        let constraint = widthAnchor.constraintEqualToAnchor(superview!.widthAnchor, multiplier: multiplier, constant: constant)
        constraint.active = true
        return constraint
    }
    
    /**
     Anchor size relative to superview based on CGSize given. Applies two constraints
     
     - parameter size: Anchors width constraint and height constraint based on size values
     - returns: List of NSLayoutConstraints in following order: width, height
     */
    func anchorSizeToSuperView(size: CGSize) -> [NSLayoutConstraint] {
        return [anchorWidthToSuperview(multiplier: size.width), anchorHeightToSuperview(multiplier: size.height)]
    }
    
    /**
     Anchor width upon view based on constant
     
     - parameter constant: Constant representing the size of the attribute associated with this dimension anchor.
     - returns: An NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
     */
    func anchorWidth(constant constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraintEqualToConstant(constant)
        constraint.active = true
        return constraint
    }
    
    /**
     Anchor height upon view based on constant
     
     - parameter constant: Constant representing the size of the attribute associated with this dimension anchor.
     - returns: An NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
     */
    func anchorHeight(constant constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraintEqualToConstant(constant)
        constraint.active = true
        return constraint
    }
    
    /**
     Anchor size upon view based on constant
     
     - parameter size: Anchors width constraint and height constraint based on size values
     - returns: List of NSLayoutConstraints in following order: width, height
     */
    func anchorSize(size: CGSize) -> [NSLayoutConstraint] {
        return [anchorWidth(constant: size.width), anchorHeight(constant: size.height)]
    }
    
    /**
     Applies necessary constraint to ensure calling view will be leading view and the trailingView is on the trailing side.
     
     - parameter trailingView: View who will be shown as the trailingView
     - parameter constant: constant offset for the constraint
     - returns: An NSLayoutConstraint object that defines an equal relationship between the attributes represented by the
     two layout anchors plus a constant offset.
     */
    func snapHorizontally(trailingView trailingView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraintEqualToAnchor(trailingView.leadingAnchor, constant: constant)
        constraint.active = true
        return constraint
    }
    
    /**
     Applies necessary constraint to ensure calling view will be trailing and the leadingView is on the leading side.
     
     - parameter leadingView: View who will be shown as the leadingView
     - parameter constant: constant offset for the constraint
     - returns: An NSLayoutConstraint object that defines an equal relationship between the attributes represented by the
     two layout anchors plus a constant offset.
     */
    func snapHorizontally(leadingView leadingView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraintEqualToAnchor(leadingView.trailingAnchor, constant: constant)
        constraint.active = true
        return constraint
    }
    
    /**
     Applies necessary constraint to ensure calling view will be top view and the bottom view will be bottom view
     
     - parameter bottomView: View who will be shown as the bottomView
     - parameter constant: constant offset for the constraint
     - returns: An NSLayoutConstraint object that defines an equal relationship between the attributes represented by the
     two layout anchors plus a constant offset.
     */
    func snapVertically(bottomView bottomView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraintEqualToAnchor(bottomView.topAnchor, constant: constant)
        constraint.active = true
        return constraint
    }
    
    /**
     Applies necessary constraint to ensure calling view will be bottom view and the top view will be top view
     
     - parameter topView: View who will be shown as the bottomView
     - parameter constant: constant offset for the constraint
     - returns: An NSLayoutConstraint object that defines an equal relationship between the attributes represented by the
     two layout anchors plus a constant offset.
     */
    func snapVertically(topView topView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = topAnchor.constraintEqualToAnchor(topView.bottomAnchor, constant: constant)
        constraint.active = true
        return constraint
    }
    
    /**
     Center constraints relative to another view based on axis parameters and offset provided
     
     - parameter axis: Specfies which or all alignments to apply constraints
     - parameter toView: Centering calling view relative to this view
     - parameter offset: The constant offset for the constraint.
     - returns: List of applied NSLayoutConstraints in following order if applicable: CenterX, CenterY
     */
    func align(axis: Axis, toView: UIView, offset: UIOffset = UIOffsetZero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraintList = [NSLayoutConstraint]()
        if axis == .CenterXAndY || axis == .CenterX {
            constraintList.append(centerXAnchor.constraintEqualToAnchor(toView.centerXAnchor, constant: offset.horizontal))
        }
        if axis == .CenterXAndY || axis == .CenterY {
            constraintList.append(centerYAnchor.constraintEqualToAnchor(toView.centerYAnchor, constant: offset.vertical))
        }
        constraintList.forEach { $0.active = true }
        return constraintList
    }
    
    /**
     Center constraints relative to superview based on axis parameters
     
     - parameter axis: Specfies which or all alignments to apply constraints
     - returns: List of applied NSLayoutConstraints in following order: CenterX, CenterY
     */
    func alignToSuperView(axis: Axis, offset: UIOffset = UIOffsetZero) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [NSLayoutConstraint]() }
        return align(axis, toView: superview, offset: offset)
    }
}
