//
//  Category+CoreDataProperties.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/23/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import Foundation
import CoreData

extension Category {
    
    @NSManaged var idCategory: NSNumber?
    @NSManaged var name: String?
    @NSManaged var type: NSNumber?
    @NSManaged var icon: String?
    @NSManaged var transactionWithCategory: NSSet?
    
    func getTypeString() -> String {
        if let typeCategory = type, let nameCategory = name {
            if typeCategory == 0 {
                if nameCategory == "Repayment" || nameCategory == "Loan" {
                    return "Expense"
                } else {
                    return "Income"
                }
            } else if typeCategory == 1 {
                return "Expense"
            } else {
                return "Income"
            }
        }
        return ""
    }
}
