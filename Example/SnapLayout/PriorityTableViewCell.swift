//
//  PriorityTableViewCell.swift
//  SnapLayout
//
//  Created by Satinder Singh on 5/4/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

/// Displays rectangle view with a constraint whose priority is updated
class PriorityTableViewCell: TitleTableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = "Priority Changing"
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setup() {
        let rectangleView = UIView()
        rectangleView.backgroundColor = .red
        contentView.addSubview(rectangleView)
        
        // Snaps square view by pinning to all 4 sides (activated constraints)
        // Then creates an inactive height constraint whose priority is updated before being activated through `squareViewSnapManager`
        // Updating height priority to avoid following runtime warning
        // http://stackoverflow.com/questions/28410309/strange-uiview-encapsulated-layout-height-error
        let squareViewSnapManager = rectangleView
            .snap(top: 48, leading: 16, bottom: 16, trailing: 16)
            .snap(height: 40, isActive: false)
        squareViewSnapManager.height?.priority = 999
        squareViewSnapManager.height?.isActive = true
        
        let circleView = UIView()
        circleView.backgroundColor = .green
        rectangleView.addSubview(circleView)
        // snaps width, height constraints and centering circle
        circleView.snap(width: 26, height: 26, centerX: 0, centerY: 0)
        circleView.layer.cornerRadius = 13
    }
    
}
