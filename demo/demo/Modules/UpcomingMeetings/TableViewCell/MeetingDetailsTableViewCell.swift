//
//  MeetingDetailsTableViewCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/06/23.
//

import UIKit

class MeetingDetailsTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var meetingTitleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var userProfileImageView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet weak var webinarStack: UIStackView!
    
    //MARK: - Variables
    static let identifier = "detailCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        cardView.layer.borderWidth = 0.1
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.height/2
    }
    
    func setUpCell(schedule: Schedule, user: ScheduleUser) {
        meetingTitleLabel.text = ("\(schedule.title) ") + (schedule.description)
        dateLabel.text = schedule.startTime.getFormattedDateWithTime()
        timeLabel.text = schedule.duration
        usernameLabel.text = user.displayName
//        if let userProfileURL = URL(string: user.avatar) {
//            userProfileImageView.load(url: userProfileURL)
//        }
        webinarStack.isHidden = (schedule.meetingType == MeetingType.c) ? true : false
    }
}
