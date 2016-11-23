//
//  Transaction+CoreDataProperties.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/23/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import Foundation
import CoreData

extension Transaction {

    @NSManaged var idTransaction: NSNumber?
    @NSManaged var amount: NSNumber?
    @NSManaged var date: NSDate?
    @NSManaged var location: String?
    @NSManaged var note: String?
    @NSManaged var imageBills: String?
    @NSManaged var categoryWithTransaction: Category?
    @NSManaged var walletWithTransaction: Wallet?
}
