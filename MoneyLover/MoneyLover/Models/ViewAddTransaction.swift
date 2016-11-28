//
//  ViewTransaction.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/28/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class ViewAddTransaction: NSObject {
    
    var iconCell: String
    var nameCell: String
    var cellIdentifier: String
    var heighForCell: CGFloat
    
    init(iconCell: String, nameCell: String, heighForCell: CGFloat, cellIdentifier: String) {
        self.iconCell = iconCell
        self.nameCell = nameCell
        self.heighForCell = heighForCell
        self.cellIdentifier = cellIdentifier
    }
}

class DataViewAddTransaction {
    
    var dataViewTransaction = [ViewAddTransaction]()
    
    init() {
        dataViewTransaction.append(ViewAddTransaction(iconCell: "", nameCell: "", heighForCell: 25, cellIdentifier: "emptyCell"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "", nameCell: "", heighForCell: 100, cellIdentifier: "emptyCell1"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "", nameCell: "Amount", heighForCell: 100, cellIdentifier: "AmountCell"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "icon_not_selected", nameCell: "Select category", heighForCell: 75, cellIdentifier: "CategoryCell"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "ic_description", nameCell: "Note", heighForCell: 50, cellIdentifier: "NoteCell"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "ic_events", nameCell: getDateCurrent(), heighForCell: 50, cellIdentifier: "DateCell"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "icon_ATM", nameCell: "ATM", heighForCell: 50, cellIdentifier: "WalletCell"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "", nameCell: "", heighForCell: 25, cellIdentifier: "emptyCell2"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "ic_location", nameCell: "Set location", heighForCell: 50, cellIdentifier: "LocationCell"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "", nameCell: "", heighForCell: 25, cellIdentifier: "emptyCell3"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "ic_photo", nameCell: "Add photo", heighForCell: 50, cellIdentifier: "PhotoCell"))
        dataViewTransaction.append(ViewAddTransaction(iconCell: "", nameCell: "", heighForCell: 25, cellIdentifier: "emptyCell4"))
    }
    
    private func getDateCurrent() -> String {
        let date = NSDate()
        return "\(date.weekDay), \(date.day) \(date.month) \(date.year)"
    }
}
