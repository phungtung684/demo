//
//  ShowIconViewController.swift
//  MoneyLover
//
//  Created by Ngo Sy Truong on 11/30/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

protocol ChooseIconDelegate: class {
    func didChooseIcon(nameIcon: String)
}

class ShowIconViewController: UIViewController {
    
    @IBOutlet weak var colectionView: UICollectionView!
    let cellIdentifier = "Cell"
    let listIcon = (1...69).map { (index) -> String in
        return "icon_\(index)"
    }
    weak var delegate: ChooseIconDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Choose Icon"
        colectionView?.dataSource = self
        colectionView?.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colectionView?.contentInset.top = 20
    }
}

extension ShowIconViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listIcon.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = colectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as? ChooseIconColectionViewCell {
            let imageView = UIImageView(frame: cell.bounds)
            imageView.image = UIImage(named: listIcon[indexPath.row])
            cell.contentView.addSubview(imageView)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ShowIconViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 32, height: 32)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 32
    }
}

extension ShowIconViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.didChooseIcon(listIcon[indexPath.row])
        self.navigationController?.popViewControllerAnimated(true)
    }
}
