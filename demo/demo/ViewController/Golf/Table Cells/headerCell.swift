//
//  headerCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 02/04/23.
//

import UIKit

class headerCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var groupNameTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        groupNameTextField.layer.cornerRadius = groupNameTextField.frame.height/2
        groupNameTextField.layer.borderWidth = 2.0
        groupNameTextField.layer.borderColor = UIColor.white.cgColor
    }
}
