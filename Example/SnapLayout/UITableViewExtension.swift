//
//  UITableViewExtension.swift
//  SnapLayout
//
//  Created by Satinder Singh on 5/4/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

extension UITableView {

    /// Wrapper for `dequeueReusableCellWithReuseIdentifier(forIndexPath:)`
    ///
    /// - Parameters:
    ///     - indexPath: Index path specifying the location of the cell.
    /// - Returns: A UITableViewCell object with the associated reuse identifier. This method always returns a valid cell.
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    /// Register cell automatically by using the cell type's name
    func register(_ cells: [UITableViewCell.Type]) {
        cells.forEach {
            register($0, forCellReuseIdentifier: String(describing: $0.self))
        }
    }

}
