//
//  ViewController.swift
//  Example-Mac
//
//  Created by Satinder Singh on 5/6/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Cocoa
import SnapLayout

class ViewController: NSViewController {
    
    fileprivate let orangeView = NSView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orangeView.wantsLayer = true
        orangeView.layer?.backgroundColor = NSColor.orange.cgColor
        view.addSubview(orangeView)
        
        orangeView.snap(top: 0, leading: 0, width: 15, height: 15)
    }
     
}

