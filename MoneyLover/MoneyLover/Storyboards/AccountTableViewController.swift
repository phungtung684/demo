//
//  AccountTableViewController.swift
//  MoneyLover
//
//  Created by Phùng Tùng on 12/2/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {

    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel?.text = "Phungtung1993@gmail.com"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
