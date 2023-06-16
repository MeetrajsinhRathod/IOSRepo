//
//  footerCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 02/04/23.
//

import UIKit

class footerCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var saveDetailsBtn: UIButton!
    @IBOutlet weak var btnImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        saveDetailsBtn.layer.cornerRadius = saveDetailsBtn.frame.height/2
        saveDetailsBtn.layer.borderWidth = 2.0
        saveDetailsBtn.layer.borderColor = UIColor.red.cgColor
        btnImg.layer.cornerRadius = btnImg.frame.width/2
    }

    //MARK: - IBAction
    @IBAction func saveDetails(_ sender: Any) {
        print("saveDetails called")
    }
}
