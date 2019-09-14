//
//  AdjacentHorizontalTableViewCell.swift
//  SnapLayout
//
//  Created by Satinder Singh on 5/5/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SnapLayout

/// Displays two views adjacent to one another horizontally
internal final class AdjacentHorizontalTableViewCell: TitleTableViewCell {
    
    fileprivate let leadingLabelConfig = SnapConfig(top: 48, leading: 16, bottom: 24)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = "Adjacent Horizontal"
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupLabels() {
        let leadingLabel = Style.subtitleLabel(text: "Leading Label")
        contentView.addSubview(leadingLabel)
        leadingLabel.snap(config: leadingLabelConfig)
        
        let trailingLabel = Style.subtitleLabel(text: "Trailing Label")
        contentView.addSubview(trailingLabel)
        trailingLabel
            .snap(leadingView: leadingLabel, constant: 16)
            .snap(to: leadingLabel, top: 0)
    }

}
