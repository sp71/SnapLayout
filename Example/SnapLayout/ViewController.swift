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
    fileprivate let containerView = UIView()
    fileprivate let emojiTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        setupContainerView()
        setupEmojiTextView()
        setupSnapLayoutLabel()
    }
    
    /// Setup Container View
    fileprivate func setupContainerView() {
        containerView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        view.addSubview(containerView)
        // Container View will now encompass entire view real estate
        _ = containerView.pinToSuperview(.all)
    }
    
    /// Setup Container View
    fileprivate func setupEmojiTextView() {
        emojiTextView.showsVerticalScrollIndicator = true
        emojiTextView.text = emojiList()
        containerView.addSubview(emojiTextView)
        // Pin text view to top, left, right of its superview and have it be 0.25 height of superview
        _ = emojiTextView.pinToSuperview([.top, .left, .right], insets: Constants.emojiTextViewInset)
        let emojiTextViewMultiplier = Constants.emojiTextViewHeightRelativeToSuperViewFactor
        _ = emojiTextView.anchorHeightToSuperview(multiplier: emojiTextViewMultiplier)
    }
    
    /// Setup label with SnapLayout text
    fileprivate func setupSnapLayoutLabel() {
        let snapLabel = UILabel()
        snapLabel.text = "SnapLayout"
        snapLabel.textColor = UIColor.white
        snapLabel.font = UIFont(name: "Avenir-Book", size: 24)
        containerView.addSubview(snapLabel)
        /// label will be below emojiTextView and aligned horizontally relative to super view
        _ = snapLabel.snapVertically(topView: emojiTextView)
        _ = snapLabel.alignToSuperView(.centerX)
    }
    
    /**
     Produces single string containing MANY emojis 😁
     - returns: String containing MANY emojis 😉
     */
    fileprivate func emojiList() -> String {
        var emojiString = "😁😂😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬😭😮😯😰😱😲😳😴😵😶😷😸😹😺😻😼😽😾😿🙀🙁🙂🙃🙄🙅🙆🙇🙈🙉🙊🙋🙌🙍🙎🙏"
        for _ in 0 ... 3 {
            emojiString += emojiString
        }

        return emojiString
    }
}

