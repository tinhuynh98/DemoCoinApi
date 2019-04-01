//
//  DashboardViewController.swift
//  CoinMarket
//
//  Created by Toof_Appsia on 3/14/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ObjectMapper
import Alamofire

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]

class DashboardViewController: BaseViewController {
    // MARK: - Properties
    @IBOutlet weak var dashboardLabel: UILabel!
    @IBOutlet weak var titleMarketCapLabel: UILabel!
    @IBOutlet weak var titleDayVolumeLabel: UILabel!
    @IBOutlet weak var titleDominanceLabel: UILabel!
    
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var ratePercentLabel: UILabel!
    @IBOutlet weak var dayVolumeLabel: UILabel!
    @IBOutlet weak var dominanceLabel: UILabel!
    @IBOutlet weak var blurImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let estimatedRowHeight: CGFloat = 100.0
    
    var tickets: Array<Ticket> = Array<Ticket>()
    var start: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews()
        self.fetchData {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Setup Subviews
    fileprivate func setupSubviews() {
        self.view.backgroundColor = UIColor.backgroundColor
        
        self.setupDashboardLabel()
        self.setupTitleMarketCapLabel()
        self.setupTitleDayVolumeLabel()
        self.setupTitleDominanceLabel()
        self.setupBlurImageView()
        self.setupTableView()
    }
    
    fileprivate func setupDashboardLabel() {
        self.dashboardLabel.setAttributedTextWith(string: ContentManager.shared.stringForKey("dashboard"),
                                                  font: UIFont.heeboMediumExtraFont,
                                                  spacing: 0.4)
    }
    
    fileprivate func setupTitleMarketCapLabel() {
        self.titleMarketCapLabel.setAttributedTextWith(string: ContentManager.shared.stringForKey("marketCap"),
                                                  font: UIFont.heeboMediumFont,
                                                  spacing: 1.09)
        self.titleMarketCapLabel.backgroundColor?.withAlphaComponent(0.5)
    }
    
    fileprivate func setupTitleDayVolumeLabel() {
        self.titleDayVolumeLabel.setAttributedTextWith(string: ContentManager.shared.stringForKey("24hVolume"),
                                                       font: UIFont.heeboMediumFont,
                                                       textColor: UIColor.white.withAlphaComponent(0.5),
                                                       spacing: 1.09)
    }
    
    fileprivate func setupTitleDominanceLabel() {
        self.titleDominanceLabel.setAttributedTextWith(string: ContentManager.shared.stringForKey("btcDominance"),
                                                       font: UIFont.heeboMediumFont,
                                                       textColor: UIColor.white.withAlphaComponent(0.5),
                                                       spacing: 1.09)
    }
    
    fileprivate func setupBlurImageView() {
        self.blurImageView.isHidden = true
    }
    
    fileprivate func setupTableView() {
        self.tableView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        self.tableView.separatorColor = UIColor.white.withAlphaComponent(0.0)
        self.tableView.estimatedRowHeight = self.estimatedRowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(CoinTableViewCell.self)
    }
    
}

// MARK: - UIScrollViewDelegate
extension DashboardViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.tableView {
            if scrollView.contentOffset.y > 0 {
                self.blurImageView.isHidden = false
            }
            else {
                self.blurImageView.isHidden = true
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CoinTableViewCell.self)
        let data = self.tickets[indexPath.row]
        cell.nameLabel.text = data.name
        cell.symbolLabel.text = data.symbol
        
        if let price = data.quotes.first?.price {
            cell.priceUSDLabel.text = "\(Double(round(1000*price)/1000))"
        }
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension DashboardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.tickets.count - 1 {
            self.start = self.tickets.count
            self.fetchData(start: start) {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension DashboardViewController {
    func fetchData(start: Int = 0, completion: @escaping () -> Void) {
        let endpoint = "https://api.coinmarketcap.com/v2/ticker/?start=\(start)&limit=10"
        
//        if let url = URL(string: endpoint) {
//            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//                if error != nil {
//                    print(error ?? "")
//                }
//                else {
//                    if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
//                        if let json = json as? JSObject, let results = json["data"] as? JSObject {
//                            for (_, value) in results {
//                                if let ticketJson = value as? JSObject, let ticket = Mapper<Ticket>().map(JSON: ticketJson) {
//                                    self.tickets.append(ticket)
//                                }
//                            }
//
//                            DispatchQueue.main.async {
//                                completion()
//                            }
//                        }
//                    }
//                }
//            })
//
//            task.resume()
//        }
    }
    
}
