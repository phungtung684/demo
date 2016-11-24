//
//  AddNewTransactionViewController.swift
//  MoneyLover
//
//  Created by Phùng Tùng on 11/25/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class AddNewTransactionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func cancelAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
