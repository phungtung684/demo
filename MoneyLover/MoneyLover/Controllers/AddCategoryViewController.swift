//
//  AddCategoryViewController.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/29/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class AddCategoryViewController: UITableViewController {
    
    @IBOutlet weak var typeCategorySegmentedControl: UISegmentedControl!
    @IBOutlet weak var inputNameTextField: UITextField!
    @IBOutlet weak var iconCategoryImageView: UIImageView!
    var nameIcon = ""
    var category: Category?
    var categoryManager = CategoryManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let category = category {
            self.title = "Edit Category"
            inputNameTextField?.text = category.name
            if category.type == 0 {
                if category.name == "Repayment" || category.name == "Loan" {
                    typeCategorySegmentedControl?.selectedSegmentIndex = 1
                } else {
                    typeCategorySegmentedControl.selectedSegmentIndex = 0
                }
            } else if category.type == 1 {
                typeCategorySegmentedControl.selectedSegmentIndex = 1
            } else {
                typeCategorySegmentedControl.selectedSegmentIndex = 0
            }
            if let icon = category.icon {
                iconCategoryImageView?.image = UIImage(named: icon)
            }
        } else {
            self.title = "New Category"
        }
        let buttonSave = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: #selector(saveAction))
        let buttonCancel = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: #selector(cancelAction))
        navigationItem.rightBarButtonItem = buttonSave
        navigationItem.leftBarButtonItem = buttonCancel
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped))
        iconCategoryImageView?.userInteractionEnabled = true
        iconCategoryImageView?.addGestureRecognizer(tapGestureRecognizer)
        self.navigationController?.navigationBar.tintColor = UIColor.greenColor()
    }
    
    func imageTapped() {
        if let chooseIcon = self.storyboard?.instantiateViewControllerWithIdentifier("ShowIconViewController") as? ShowIconViewController {
            chooseIcon.delegate = self
            self.navigationController?.pushViewController(chooseIcon, animated: true)
        }
    }
    
    @objc private func saveAction() {
        if let category = category {
            print(category.name)
        } else {
            if let nameCategory = self.inputNameTextField?.text, let typeCategory = self.typeCategorySegmentedControl?.selectedSegmentIndex {
                let category = CategoryModel(nameCategory: nameCategory, typeCategory: typeCategory, iconCategory: nameIcon, idCategory: 0)
                if categoryManager.checkCategoryExisted(nameCategory) {
                    presentAlertWithTitle("Error", message: "Category was existed")
                } else {
                    if categoryManager.addCategory(category) {
                        presentAlertWithTitle("OK", message: "Completed add category")
                    } else {
                        presentAlertWithTitle("Error", message: "Can't add category.")
                    }
                }
            }
        }
    }
    
    @objc private func cancelAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension AddCategoryViewController: ChooseIconDelegate {
    func didChooseIcon(nameIcon: String) {
        self.nameIcon = nameIcon
        self.iconCategoryImageView?.image = UIImage(named: nameIcon)
    }
}
