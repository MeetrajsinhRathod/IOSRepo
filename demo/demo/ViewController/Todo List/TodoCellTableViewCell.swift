//
//  TodoCellTableViewCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 27/03/23.
//

import UIKit

class TodoCellTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var checkBox: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    //MARK: - Variables
    var isDone = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleCheckBox(tapGesture:)))
        checkBox.isUserInteractionEnabled = true
        checkBox.addGestureRecognizer(tapGesture)
    }
    
    func set(title: String, isDone: Bool) {
        self.title.text = title
        self.isDone = isDone
    }
}

//MARK: - ObjC
extension TodoCellTableViewCell {
    
    @objc
    func toggleCheckBox(tapGesture: UITapGestureRecognizer) {
        guard let tappedImage = tapGesture.view as? UIImageView
        else { return }
        let attributedText = NSMutableAttributedString(string: title.text ?? "")
        if isDone {
            isDone = false
            tappedImage.image = UIImage(systemName: "checkmark.circle")
            attributedText.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedText.length - 1))
        } else {
            isDone = true
            tappedImage.image = UIImage(systemName: "circle")
            attributedText.addAttribute(.strikethroughStyle, value: 0, range: NSMakeRange(0, attributedText.length - 1))
        }
        title.attributedText = attributedText
    }
}
