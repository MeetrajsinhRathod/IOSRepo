//
//  playerCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 02/04/23.
//

import UIKit

class playerCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var replace: UIButton!
    
    //MARK: - Variables
    var isChecked = false

    override func awakeFromNib() {
        super.awakeFromNib()
        playerImage.layer.cornerRadius = playerImage.frame.size.width/2
    }

    //MARK: - IBOutlets
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
    
    func set(name: String, number: String, image: UIImage) {
        self.playerName.text = name
        self.playerNumber.text = number
        self.playerImage.image = image
    }
}
