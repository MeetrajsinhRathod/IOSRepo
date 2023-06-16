//
//  TableViewCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 21/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var componentBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        componentBtn.layer.borderWidth = 2.0
        componentBtn.layer.cornerRadius = 5.0
    }
}
