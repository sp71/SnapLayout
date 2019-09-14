//
//  WelcomeTableViewCell.swift
//  SnapLayout
//
//  Created by Satinder Singh on 5/4/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SnapLayout

/// Displays Welcoming information
internal final class WelcomeTableViewCell: TitleTableViewCell {
    
    fileprivate let subtitleLabel = Style.subtitleLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = "Welcome!"
        setupSubtitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupSubtitleLabel() {
        subtitleLabel.text = "SnapLayout is a library to help remove all that boilerplate constraint code. See more examples below\n😃"
        contentView.addSubview(subtitleLabel)
        // applies 4 constraints to superview for top constraint, leading constraint, bottom constraint, and trailing constraint
        subtitleLabel.snap(top: 48, leading: 24, bottom: 8, trailing: 24)
    }
    
}
