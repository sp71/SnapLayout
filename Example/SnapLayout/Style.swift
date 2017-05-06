//
//  Style.swift
//  SnapLayout
//
//  Created by Satinder Singh on 5/5/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

/// Various Styles for labels
struct Style {
    
    /// Builder for titleLabels
    ///
    /// - Parameter text: String to update text value (default nil)
    /// - Returns: UILabel initalized with text, font, 0 lines, and center alignment
    static func titleLabel(text: String? = nil) -> UILabel {
        let titleLabel = UILabel()
        titleLabel.text = text
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        return titleLabel
    }
    
    /// Builder for subtitleLabel
    ///
    /// - Parameter text: String to update text value (default nil)
    /// - Returns: UILabel initalized with text, font, 0 lines, and center alignment
    static func subtitleLabel(text: String? = nil) -> UILabel {
        let subtitleLabel = UILabel()
        subtitleLabel.text = text
        subtitleLabel.font = UIFont(name: "Avenir-Book", size: 15)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        return subtitleLabel
    }
}
