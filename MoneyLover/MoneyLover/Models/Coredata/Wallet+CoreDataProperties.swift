//
//  Wallet+CoreDataProperties.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/23/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import Foundation
import CoreData

extension Wallet {

    @NSManaged var idWallet: String?
    @NSManaged var amount: NSNumber?
    @NSManaged var name: String?
    @NSManaged var icon: String?
    @NSManaged var user: User?
    @NSManaged var transactionWithWallet: NSSet?
}
