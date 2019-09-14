//
//  ViewController.swift
//  SnapLayout
//
//  Created by Satinder Singh on 10/02/2016.
//  Copyright (c) 2016 Satinder Singh. All rights reserved.
//

import UIKit
import SnapLayout

/// Displays list of cells demonstrating `SnapLayout` usage
internal final class ViewController: UIViewController {
    
    fileprivate let tableView = UITableView()
    fileprivate let cellList: [IndexManager] = [.welcome, .adjacentVertical, .adjacentHorizontal, .size, .priority]

    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Private Methods
    fileprivate func setupTableView() {
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register([WelcomeTableViewCell.self, PriorityTableViewCell.self, SizeTableViewCell.self, AdjacentVerticalTableViewCell.self,
                            AdjacentHorizontalTableViewCell.self])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .black
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.alwaysBounceVertical = true
        tableView.separatorInset = .zero
        tableView.bounces = true
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView(frame: .zero)
        view.addSubview(tableView)
        tableView.snap(config: .zero) // snaps top, leading, bottom, and trailing
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellList[indexPath.row] {
        case .welcome:
            return tableView.dequeueCell(for: indexPath) as WelcomeTableViewCell
        case .priority:
            return tableView.dequeueCell(for: indexPath) as PriorityTableViewCell
        case .size:
            return tableView.dequeueCell(for: indexPath) as SizeTableViewCell
        case .adjacentVertical:
            return tableView.dequeueCell(for: indexPath) as AdjacentVerticalTableViewCell
        case .adjacentHorizontal:
            return tableView.dequeueCell(for: indexPath) as AdjacentHorizontalTableViewCell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch cellList[indexPath.row] {
        case .size:
            return SizeTableViewCell.height
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList.count
    }

}
