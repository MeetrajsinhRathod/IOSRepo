//
//  headerCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 02/04/23.
//

import UIKit

class headerCell: UITableViewCell {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var groupNameTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        groupNameTextField.layer.cornerRadius = groupNameTextField.frame.height/2
        groupNameTextField.layer.borderWidth = 2.0
        groupNameTextField.layer.borderColor = UIColor.white.cgColor
//        groupNameTextField.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
