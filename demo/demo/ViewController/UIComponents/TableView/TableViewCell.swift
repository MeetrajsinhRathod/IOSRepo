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
        // Initialization code
        componentBtn.layer.borderWidth = 2.0
        componentBtn.layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
