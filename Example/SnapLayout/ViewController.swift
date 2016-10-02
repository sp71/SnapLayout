//
//  ViewController.swift
//  SnapLayout
//
//  Created by Satinder Singh on 10/02/2016.
//  Copyright (c) 2016 Satinder Singh. All rights reserved.
//

import UIKit
import SnapLayout

internal final class ViewController: UIViewController {
    
    struct Constants {
        static let emojiTextViewHeightRelativeToSuperViewFactor = CGFloat(0.30)
        static let emojiTextViewInset = UIEdgeInsets(top: 16, left: 8, bottom: 0, right: -8)
    }
    
    /// Container view encompassing all subviews of View Controller
    private let containerView = UIView()
    private let emojiTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        setupContainerView()
        setupEmojiTextView()
        setupSnapLayoutLabel()
    }
    
    /// Setup Container View
    private func setupContainerView() {
        containerView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.2)
        view.addSubview(containerView)
        // Container View will now encompass entire view real estate
        containerView.pinToSuperview(.All)
    }
    
    /// Setup Container View
    private func setupEmojiTextView() {
        emojiTextView.showsVerticalScrollIndicator = true
        emojiTextView.text = emojiList()
        containerView.addSubview(emojiTextView)
        // Pin text view to top, left, right of its superview and have it be 0.25 height of superview
        emojiTextView.pinToSuperview([.Top, .Left, .Right], insets: Constants.emojiTextViewInset)
        let emojiTextViewMultiplier = Constants.emojiTextViewHeightRelativeToSuperViewFactor
        emojiTextView.anchorHeightToSuperview(multiplier: emojiTextViewMultiplier)
    }
    
    /// Setup label with SnapLayout text
    private func setupSnapLayoutLabel() {
        let snapLabel = UILabel()
        snapLabel.text = "SnapLayout"
        snapLabel.textColor = UIColor.whiteColor()
        snapLabel.font = UIFont(name: "Avenir-Book", size: 24)
        containerView.addSubview(snapLabel)
        /// label will be below emojiTextView and aligned horizontally relative to super view
        snapLabel.snapVertically(topView: emojiTextView)
        snapLabel.alignToSuperView(.CenterX)
    }
    
    /**
     Produces single string containing MANY emojis 😁
     - returns: String containing MANY emojis 😉
     */
    private func emojiList() -> String {
        var emojiString = "😁😂😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬😭😮😯😰😱😲😳😴😵😶😷😸😹😺😻😼😽😾😿🙀🙁🙂🙃🙄🙅🙆🙇🙈🙉🙊🙋🙌🙍🙎🙏"
        for _ in 0 ... 3 {
            emojiString += emojiString
        }

        return emojiString
    }
}

