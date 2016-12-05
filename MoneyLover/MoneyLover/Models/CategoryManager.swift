//
//  CategoryManager.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 12/2/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class CategoryManager: NSObject {

    lazy var managedObjectContext = CoreDataManager().managedObjectContext
    var dataStored = DataStored()
    
    func checkCategoryExisted(name: String) -> Bool {
        let listCategory = dataStored.fetchRecordsForEntity("Category", inManagedObjectContext: managedObjectContext)
        for categories in listCategory {
            if let category = categories as? Category {
                if category.name == name {
                    return true
                }
            }
        }
        return false
    }
    
    func addCategory(category: CategoryModel) -> Bool {
        if let categories = dataStored.createRecordForEntity("Category", inManagedObjectContext: managedObjectContext) as? Category {
            categories.icon = category.iconCategory
            categories.name = category.nameCategory
            categories.type = category.typeCategory
            do {
                try managedObjectContext.save()
                return true
            } catch {
                return false
            }
        }
        return false
    }
}