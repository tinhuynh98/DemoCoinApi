//
//  CoinTableViewCell.swift
//  CoinMarket
//
//  Created by Toof on 3/31/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceUSDLabel: UILabel!
    @IBOutlet weak var percentChangeLabel: UILabel!
    
    // MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupSubviews()
    }
    
    // MARK: - Setup Subviews
    fileprivate func setupSubviews() {
        self.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        self.selectionStyle = .none
        
        self.setupContainView()
        self.setupNameLabel()
        self.setupSymbolLabel()
        self.setupPriceUSDLabel()
        self.setupPercentChangeLabel()
    }
    
    fileprivate func setupContainView() {
        self.containView.backgroundColor = UIColor.white.withAlphaComponent(0.07)
        self.containView.layer.cornerRadius = 6
    }
    
    fileprivate func setupNameLabel() {
        
    }
    
    fileprivate func setupSymbolLabel() {
        
    }
    
    fileprivate func setupPriceUSDLabel() {
        
    }
    
    fileprivate func setupPercentChangeLabel() {
        
    }
    
}
