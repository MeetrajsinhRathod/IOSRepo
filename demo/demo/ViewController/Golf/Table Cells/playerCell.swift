//
//  playerCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 02/04/23.
//

import UIKit

class playerCell: UITableViewCell {
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var replace: UIButton!
    
    var isChecked = false

    override func awakeFromNib() {
        super.awakeFromNib()
        
        playerImage.layer.cornerRadius = playerImage.frame.size.width/2
    }
    
    func set(name: String, number: String, image: UIImage) {
        self.playerName.text = name
        self.playerNumber.text = number
        self.playerImage.image = image
    }

    @IBAction func isChecked(_ sender: Any) {
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
