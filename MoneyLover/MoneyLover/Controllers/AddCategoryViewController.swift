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
    var category = CategoryModel()
    var categoryManager = CategoryManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Category"
        let buttonSave = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: #selector(saveAction))
        let buttonCancel = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: #selector(cancelAction))
        navigationItem.rightBarButtonItem = buttonSave
        navigationItem.leftBarButtonItem = buttonCancel
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped))
        iconCategoryImageView?.userInteractionEnabled = true
        iconCategoryImageView?.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func imageTapped() {
        if let chooseIcon = self.storyboard?.instantiateViewControllerWithIdentifier("ShowIconViewController") as? ShowIconViewController {
            chooseIcon.delegate = self
            self.navigationController?.pushViewController(chooseIcon, animated: true)
        }
    }
    
    @objc private func saveAction() {
        if let nameCategory = self.inputNameTextField?.text, let typeCategory = self.typeCategorySegmentedControl?.selectedSegmentIndex {
            category.nameCategory = nameCategory
            category.typeCategory = typeCategory
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
    
    @objc private func cancelAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension AddCategoryViewController: ChooseIconDelegate {
    func didChooseIcon(nameIcon: String) {
        category.iconCategory = nameIcon
        self.iconCategoryImageView?.image = UIImage(named: nameIcon)
    }
}
