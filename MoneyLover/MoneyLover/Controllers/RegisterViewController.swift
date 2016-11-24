//
//  RegisterViewController.swift
//  MoneyLover
//
//  Created by Phùng Tùng on 11/24/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var loginSegmentControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton?.round(6, borderWith: 0, borderColor: UIColor.blueColor().CGColor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeItemAction(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loginButton?.setTitle("Đăng ký", forState: .Normal)
        } else {
            loginButton?.setTitle("Đăng nhập", forState: .Normal)
        }
    }
    
    @IBAction func loginAction(sender: AnyObject) {
    }
    
    @IBAction func cancelAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
