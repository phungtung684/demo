//
//  CustomView.swift
//  MoneyLover
//
//  Created by Phung Tung on 11/24/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

extension UIView {
    
    func round(radius: CGFloat, borderWith: CGFloat, borderColor: CGColor?) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWith
        self.layer.borderColor = borderColor
    }
}

extension UIViewController {
    
    func presentAlertWithTitle(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
