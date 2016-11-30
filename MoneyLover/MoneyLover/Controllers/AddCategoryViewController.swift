//
//  AddCategoryViewController.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/29/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let listCellViewAddCategory = DataViewAddCategory()
    var nameIcon: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Category"
        tableView?.delegate = self
        tableView?.dataSource = self
        let buttonSave = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: #selector(saveAction))
        let buttonCancel = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: #selector(cancelAction))
        navigationItem.rightBarButtonItem = buttonSave
        navigationItem.leftBarButtonItem = buttonCancel
    }
    
    @objc private func saveAction() {
    }
    
    @objc private func cancelAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension AddCategoryViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCellViewAddCategory.dataViewCategory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let viewCategory = listCellViewAddCategory.dataViewCategory[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(viewCategory.cellIdentifier, forIndexPath: indexPath)
        if let cellCategory = cell as? InputCategoryCell {
            cellCategory.configCellWithContent(nameIcon)
            cellCategory.chooseIconCategoryButton.addTarget(self, action: #selector(chooseIcon), forControlEvents: UIControlEvents.TouchUpInside)
        }
        return cell
    }
    
    @objc private func chooseIcon() {
        if let chooseIcon = self.storyboard?.instantiateViewControllerWithIdentifier("ShowIconViewController") as? ShowIconViewController {
            chooseIcon.delegate = self
            self.navigationController?.pushViewController(chooseIcon, animated: true)
        }
    }
}

extension AddCategoryViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let dataCell = listCellViewAddCategory.dataViewCategory[indexPath.row]
        return dataCell.heighForCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

extension AddCategoryViewController: ChooseIconDelegate {
    func didChooseIcon(nameIcon: String) {
        self.nameIcon = nameIcon
        self.tableView?.reloadData()
    }
}
