//
//  footerCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 02/04/23.
//

import UIKit

class footerCell: UITableViewCell {
    
    @IBOutlet weak var saveDetailsBtn: UIButton!
    @IBOutlet weak var btnImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        saveDetailsBtn.layer.cornerRadius = saveDetailsBtn.frame.height/2
        saveDetailsBtn.layer.borderWidth = 2.0
        saveDetailsBtn.layer.borderColor = UIColor.red.cgColor
        
        btnImg.layer.cornerRadius = btnImg.frame.width/2
    }

    @IBAction func saveDetails(_ sender: Any) {
        print("saveDetails called")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
