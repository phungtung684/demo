//
//  User+CoreDataProperties.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/23/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import Foundation
import CoreData

extension User {

    @NSManaged var idUser: NSNumber?
    @NSManaged var email: String?
    @NSManaged var fullname: String?
    @NSManaged var password: String?
    @NSManaged var wallet: NSSet?
}
