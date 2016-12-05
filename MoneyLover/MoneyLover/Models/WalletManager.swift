//
//  WalletManager.swift
//  MoneyLover
//
//  Created by Phùng Tùng on 12/5/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class WalletManager {
    lazy var managedObjectContext = CoreDataManager().managedObjectContext
    var dataStored = DataStored()
}
