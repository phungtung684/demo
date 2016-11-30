//
//  CategoryCell1.swift
//  MoneyLover
//
//  Created by Ngo Truong on 11/29/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class InputCategoryCell: UITableViewCell {
    
    @IBOutlet weak var chooseIconCategoryButton: UIButton!
    @IBOutlet weak var inputCategoryTextfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCellWithContent(nameIcon: String?) {
        inputCategoryTextfield?.borderStyle = UITextBorderStyle.None
        self.chooseIconCategoryButton?.setImage(UIImage(named: nameIcon ?? "icon_not_selected"), forState: .Normal)
    }
}
