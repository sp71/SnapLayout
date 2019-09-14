//
//  AdjacentVerticalTableViewCell.swift
//  SnapLayout
//
//  Created by Satinder Singh on 5/5/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SnapLayout

/// Displays two views adjacent to one another vertically
internal final class AdjacentVerticalTableViewCell: TitleTableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = "Adjacent Vertical Views"
        setupSubtitleLabel()
    }
    
    fileprivate func setupSubtitleLabel() {
        let subtitleLabel = Style.subtitleLabel(text: "This label has an adjacent constraint to the title label above. It also has three"
        + " additional constraints to the superview for leading, bottom, and trailing.")
        contentView.addSubview(subtitleLabel)
        subtitleLabel
            .snap(topView: titleLabel, constant: 16) // adjacent constraint
            .snap(leading: 48, bottom: 8, trailing: 48)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
