//
//  WalletModel.swift
//  MoneyLover
//
//  Created by Phùng Tùng on 12/5/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class WalletModel: NSObject {
    
    var name = ""
    var idWallet = ""
    var iconName = ""
    var amount = 0.0
    
    init(name: String, iconName: String, amount: Double) {
        self.name = name
        self.idWallet = NSUUID().UUIDString
        self.iconName = iconName
        self.amount = amount
    }
}

class ListWalletAvalable {
    var listWallet = [WalletModel]()
    init() {
        listWallet.append(WalletModel(name: "ATM", iconName: "icon_94", amount: 0.0))
        listWallet.append(WalletModel(name: "Tiền mặt", iconName: "icon_117", amount: 0.0))
    }
}
