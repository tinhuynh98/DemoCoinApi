//
//  TrainViewController.swift
//  CoinMarket
//
//  Created by Toof on 4/3/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit

class TrainViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupSubviews()
    }
    
    // MARK: - Setup Subviews
    fileprivate func setupSubviews() {
        self.setupTableView()
    }
    
    fileprivate func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: "TrainTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TrainTableViewCell")
    }
    
}

extension TrainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        }
        else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainTableViewCell", for: indexPath) as! TrainTableViewCell
        cell.titleLabel.text = "Toan"
        cell.detailLabel.text = "Pro"
        return cell
    }
    
}
