//
//  SearchViewController.swift
//  CoinMarket
//
//  Created by Toof on 3/26/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchViewController: BaseViewController {
    // MARK: - Properties
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupSubviews()
    }
    
    // MARK: Setup Subviews
    func setupSubviews() {
        self.setupTableView()
        self.setupSearchBar()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setupSearchBar() {
        
    }
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
}
