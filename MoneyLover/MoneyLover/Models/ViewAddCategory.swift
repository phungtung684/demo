//
//  ViewAddCategory.swift
//  MoneyLover
//
//  Created by Ngo Truong on 11/29/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class ViewAddCategory: NSObject {
    
    var cellIdentifier: String
    var heighForCell: CGFloat
    
    init(heighForCell: CGFloat, cellIdentifier: String) {
        self.heighForCell = heighForCell
        self.cellIdentifier = cellIdentifier
    }
}

class DataViewAddCategory {
    
    var dataViewCategory = [ViewAddCategory]()
    
    init() {
        dataViewCategory.append(ViewAddCategory(heighForCell: 25, cellIdentifier: "emptyCell"))
        dataViewCategory.append(ViewAddCategory(heighForCell: 100, cellIdentifier: "emptyCell1"))
        dataViewCategory.append(ViewAddCategory(heighForCell: 75, cellIdentifier: "categoryCell"))
        dataViewCategory.append(ViewAddCategory(heighForCell: 50, cellIdentifier: "typeCell"))
    }
}
