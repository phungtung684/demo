//
//  ChangePasswordTableViewController.swift
//  MoneyLover
//
//  Created by Phùng Tùng on 12/2/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class ChangePasswordTableViewController: UITableViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var oldPasswordLabel: UITextField!
    @IBOutlet weak var newPasswordLabel: UITextField!
    var userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("TitleChangePassword", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveAction(sender: AnyObject) {
        if oldPasswordLabel.text != "" {
            if checkTextFields(newPasswordLabel.text ?? "") {
                if userManager.changePassword(oldPasswordLabel?.text ?? "", newPassword: newPasswordLabel?.text ?? "") {
                } else {
                    let alertController = UIAlertController(title: NSLocalizedString("LogoutConfirmTitle", comment: ""), message: NSLocalizedString("AlertWrongPasswordMessage", comment: ""), preferredStyle: .Alert)
                    let okAction = UIAlertAction(title: NSLocalizedString("ButtonTitleOK", comment: ""), style: .Default, handler: nil)
                    alertController.addAction(okAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
        } else {
            let alertController = UIAlertController(title: NSLocalizedString("LogoutConfirmTitle", comment: ""), message: NSLocalizedString("AlertMessageOldPassword", comment: ""), preferredStyle: .Alert)
            let okAction = UIAlertAction(title: NSLocalizedString("ButtonTitleOK", comment: ""), style: .Default, handler: nil)
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    private func checkTextFields(password: String) -> Bool {
        if password.isBlank {
            presentAlertWithTitle(NSLocalizedString("ErrorAlertTitle", comment: ""), message: NSLocalizedString("AlertMessagePasswordEmpty", comment: ""))
            return false
        } else if password.characters.count < 6 {
            presentAlertWithTitle(NSLocalizedString("ErrorAlertTitle", comment: ""), message: NSLocalizedString("AlertMessagePasswordLetters", comment: ""))
            return false
        } else if password.isContainSpecialCharacter {
            presentAlertWithTitle(NSLocalizedString("ErrorAlertTitle", comment: ""), message: NSLocalizedString("AlertMessagePasswordInvalid", comment: ""))
            return false
        } else {
            return true
        }
    }
}
