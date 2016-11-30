//
//  AmountCell.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/29/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class AmountCell: UITableViewCell {

    @IBOutlet weak var typeMoneyButton: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var inputAmountTextfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCellWithContent(viewTransaction: ViewAddTransaction) {
        self.amountLabel?.text = viewTransaction.nameCell
    }
}
