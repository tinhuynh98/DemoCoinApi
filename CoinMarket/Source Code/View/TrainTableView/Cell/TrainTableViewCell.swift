//
//  TrainTableViewCell.swift
//  CoinMarket
//
//  Created by Toof on 4/3/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit

class TrainTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    // MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
