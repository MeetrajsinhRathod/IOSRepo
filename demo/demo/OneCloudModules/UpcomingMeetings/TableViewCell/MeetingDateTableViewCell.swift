//
//  MeetingDateTableViewCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/06/23.
//

import UIKit

class MeetingDateTableViewCell: UITableViewCell {
        
    //MARK: - IBOutlets
    @IBOutlet private weak var dateLabel: UILabel!
    
    //MARK: - Variables
    static let identifier = "dateCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDate(date: String) {
        dateLabel.text = date
    }
}
