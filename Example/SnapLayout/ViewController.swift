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
        static let emojiLabelEdgeInsets = ConstraintEdgeInsets(top: 50, leading: 8, trailing: -8)
    }
    
    /// Container view encompassing all subviews of View Controller
    fileprivate let containerView = UIView()
    fileprivate let emojiLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        setupContainerView()
        setupEmojiLabel()
        setupSnapLayoutLabel()
    }
    
    /// Setup Container View
    fileprivate func setupContainerView() {
        containerView.backgroundColor = UIColor(red: 219/255, green: 165/255, blue: 182/255, alpha: 1)
        view.addSubview(containerView)
        // Container View will now encompass entire view real estate
        containerView.pinToSuperview(.zero)
    }
    
    /// Setup Container View
    fileprivate func setupEmojiLabel() {
        emojiLabel.text = emojiList()
        containerView.addSubview(emojiLabel)
        emojiLabel.pinToSuperview(Constants.emojiLabelEdgeInsets)
        emojiLabel.numberOfLines = 0
    }
    
    /// Setup label with SnapLayout text
    fileprivate func setupSnapLayoutLabel() {
        let snapLabel = UILabel()
        snapLabel.text = "SnapLayout"
        snapLabel.textColor = UIColor.white
        snapLabel.font = UIFont(name: "Avenir-Book", size: 24)
        containerView.addSubview(snapLabel)
        // label will be below emojiTextView and aligned horizontally relative to super view
        snapLabel.snapVertically(topView: emojiLabel)
        snapLabel.alignToSuperView(.centerX)
    }
    
    /**
     Produces single string containing MANY emojis 😁
     - returns: String containing MANY emojis 😉
     */
    fileprivate func emojiList() -> String {
        return "😁😂😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬"
    }
}

