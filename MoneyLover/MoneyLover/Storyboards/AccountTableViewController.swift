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
    var userManager = UserManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userID = NSUserDefaults.standardUserDefaults().stringForKey("userID") {
            emailLabel?.text = userID
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logoutAction(sender: AnyObject) {
        let alertController = UIAlertController(title: AlerMessageConstants.logoutConfirmTitle, message: AlerMessageConstants.logoutConfirmMessage, preferredStyle: .Alert)
        let logoutAction = UIAlertAction(title: ButtonTitleConstants.logout, style: .Default) { (logoutaction) in
            LoadingIndicatorView.show(self.tableView, loadingText: CommonStrings.titleLoadingIndicator)
            self.userManager.logout()
            self.showLoginStoryboard()
        }
        alertController.addAction(logoutAction)
        let cancelAction = UIAlertAction(title: ButtonTitleConstants.cancel, style: .Default, handler: nil)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func showLoginStoryboard() {
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            let mainStoryboard = UIStoryboard(name: "Login", bundle: nil)
            if let loginVC = mainStoryboard.instantiateViewControllerWithIdentifier("LoginViewController") as? LoginViewController {
                appDelegate.window?.rootViewController = loginVC
                LoadingIndicatorView.hide()
                appDelegate.window?.makeKeyAndVisible()
            }
        }
    }
}
