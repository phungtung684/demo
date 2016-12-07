//
//  TransactionModel.swift
//  MoneyLover
//
//  Created by Ngo Truong on 12/6/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class TransactionModel: NSObject {
    
    var idTransaction = 0
    var amount = 0.0
    var date = NSDate()
    var note = ""
    var categoryWithTransaction: CategoryModel?
    var walletWithTransaction: Wallet?
    
    override init() {
        super.init()
    }
}
