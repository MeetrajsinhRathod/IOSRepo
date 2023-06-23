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
    var position = 0
    weak var todoTableViewVC: TodoListViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleCheckBox(tapGesture:)))
        checkBox.isUserInteractionEnabled = true
        checkBox.addGestureRecognizer(tapGesture)
    }
    
    func set(title: String, isDone: Bool, position: Int) {
        self.title.text = title
        self.isDone = isDone
        self.position = position
        setTask()
    }
    
    func setTask() {
        let attributedText = NSMutableAttributedString(string: title.text ?? "")
        if isDone {
            checkBox.image = UIImage(systemName: "checkmark.circle")
            attributedText.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedText.length - 1))
        } else {
            checkBox.image = UIImage(systemName: "circle")
            attributedText.addAttribute(.strikethroughStyle, value: 0, range: NSMakeRange(0, attributedText.length - 1))
        }
        title.attributedText = attributedText
    }
}

//MARK: - ObjC
extension TodoCellTableViewCell {
    
    @objc
    func toggleCheckBox(tapGesture: UITapGestureRecognizer) {
        if isDone {
            isDone = false
            setTask()
        } else {
            isDone = true
            setTask()
        }
        todoTableViewVC?.todoIsDone(position: position, isDone: isDone)
    }
}
