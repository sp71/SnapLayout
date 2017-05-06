//
//  SizeTableViewCell.swift
//  SnapLayout
//
//  Created by Satinder Singh on 5/5/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SnapLayout

/// Shows how to snap two views horizontally and vertically
internal final class SizeTableViewCell: TitleTableViewCell {

    /// Static height for AdjacentVerticalTableViewCell
    static let height = CGFloat(100)

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = "Sizing views"
        let redView = UIView()
        redView.backgroundColor = .red
        contentView.addSubview(redView)

        // snaps leading, bottom, .25 of contentView width, and half the height of contentView
        redView.snap(leading: 0, bottom: 0)
            .snapWidth(to: contentView, multiplier: 0.4)
            .snapHeight(to: contentView, multiplier: 0.5)

        let greenView = UIView()
        greenView.backgroundColor = .green
        contentView.addSubview(greenView)

        // snaps bottom, trailing, and matches width and height of redView
        greenView.snap(bottom: 0, trailing: 0)
            .snapWidth(to: redView)
            .snapHeight(to: redView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
