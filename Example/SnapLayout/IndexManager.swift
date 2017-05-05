//
//  IndexManager.swift
//  SnapLayout
//
//  Created by Satinder Singh on 5/4/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

/// Manages Tableview logic of which cell to display within `ViewController`
internal enum IndexManager {
    
    /// Displays `WelcomeTableViewCell`
    case welcome
    
    /// Displays `PriorityTableViewCell`
    case priority

    /// Displays `SizeTableViewCell`
    case size
    
    /// Displays `AdjacentVerticalTableViewCell`
    case adjacentVertical
    
    /// Displays `AdjacentHorizontalTableViewCell`
    case adjacentHorizontal

}
