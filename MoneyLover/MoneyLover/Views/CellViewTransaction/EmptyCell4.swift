//
//  EmptyCell4.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/29/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class EmptyCell4: UITableViewCell {
    
    func configCellWithContent(viewTransaction: ViewAddTransaction) {
        self.textLabel?.text = viewTransaction.nameCell
        self.imageView?.image = UIImage(named: viewTransaction.iconCell)
    }
}