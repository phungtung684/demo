//
//  ValidateText.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/24/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

extension String {
    
    var isBlank: Bool {
        get {
            let trimmed = stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            return trimmed.isEmpty
        }
    }
    
    var isEmail: Bool {
        return self.rangeOfString("^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$", options: .RegularExpressionSearch) == nil
    }
    
    var isCheckSpecialCharacter: Bool {
        return self.rangeOfString(".*[^A-Za-z0-9].*", options: .RegularExpressionSearch) != nil
    }
}
