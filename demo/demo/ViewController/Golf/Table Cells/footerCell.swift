//
//  footerCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 02/04/23.
//

import UIKit

class footerCell: UITableViewCell {

    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var rightImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnView.layer.cornerRadius = btnView.frame.height/2
        btnView.layer.borderWidth = 2.0
        btnView.layer.borderColor = UIColor.red.cgColor
        
        rightImg.layer.cornerRadius = rightImg.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
