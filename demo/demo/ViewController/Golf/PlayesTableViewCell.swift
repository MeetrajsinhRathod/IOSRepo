//
//  PlayesTableViewCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 31/03/23.
//

import UIKit

class PlayesTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var replace: UIButton!
    
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        playerImage.layer.cornerRadius = playerImage.frame.size.width/2

    }
    
    func set(name: String, number: String, image: UIImage) {
        self.playerName.text = name
        self.playerNumber.text = number
        self.playerImage.image = image
    }

    @IBAction func checkBoxAction(_ sender: Any) {
        
        if isChecked {
            isChecked = false
            replace.isHidden = false
            checkBox.setImage(UIImage(systemName: "circle"), for: .normal)
        } else {
            isChecked = true
            replace.isHidden = true
            checkBox.setImage(UIImage(named: "radio"), for: .normal)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
