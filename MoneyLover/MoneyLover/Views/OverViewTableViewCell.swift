//
//  OverViewTableViewCell.swift
//  MoneyLover
//
//  Created by Phùng Tùng on 11/28/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {

    @IBOutlet weak var openBalanceLabel: UILabel!
    @IBOutlet weak var endingBalanceLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
