//
//  ShowCategoryViewController.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/29/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class ShowCategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataStored = DataStored()
    lazy var managedObjectContext = CoreDataManager().managedObjectContext
    var dataCategory = [Category]()
    var rightbutton = UIBarButtonItem()
    let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
        self.title = "Show Category"
        self.navigationController?.navigationBar.tintColor = UIColor(hex: 80, alpha: 1)
        let listCategory = dataStored.fetchRecordsForEntity("Category", inManagedObjectContext: managedObjectContext)
        if listCategory.count == 0 {
            rightbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(addAction))
            navigationItem.rightBarButtonItem = rightbutton
        } else {
            for categories in listCategory {
                if let category = categories as? Category {
                    dataCategory.append(category)
                }
            }
            rightbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: #selector(editAction))
            navigationItem.rightBarButtonItem = rightbutton
        }
    }
    
    @objc private func addAction() {
        if let addCategory = self.storyboard?.instantiateViewControllerWithIdentifier("AddCategoryViewController") as? AddCategoryViewController {
            let navController = UINavigationController(rootViewController: addCategory)
            LoadingIndicatorView.hide()
            self.presentViewController(navController, animated:true, completion: nil)
        }
    }
    
    @objc private func editAction() {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ShowCategoryViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCategory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? ShowCategoryTableViewCell {
            let category = dataCategory[indexPath.row]
            cell.configCellWithContent(category)
            return cell
        }
        return UITableViewCell()
    }
}

extension ShowCategoryViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
