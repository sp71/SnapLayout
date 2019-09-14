//
//  TitleTableViewCell.swift
//  SnapLayout
//
//  Created by Satinder Singh on 5/4/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SnapLayout

/// Displays title Label to user. **Highly** encouraged to subclass to get titleLabel
internal class TitleTableViewCell: UITableViewCell {

    let titleLabel = Style.titleLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snap(top: 8, leading: 16, trailing: 16)
    }
}
