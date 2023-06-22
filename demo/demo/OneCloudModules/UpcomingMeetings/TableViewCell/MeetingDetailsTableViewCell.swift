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
    @IBOutlet private weak var menuButton: UIButton!
    @IBOutlet private weak var joinMeetingButton: UIButton!
    
    //MARK: - Variables
    static let identifier = "detailCell"
    var presentDialogDelegate: Presentable?
    var actionMappings: [UIAction.Identifier: UIActionHandler] = [:]
    var meetingId = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        cardView.layer.borderWidth = 0.1
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        joinMeetingButton.layer.cornerRadius = 5
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.height/2
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(tapGestureRecognizer:)))
        menuButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func tapped(tapGestureRecognizer: UITapGestureRecognizer) {
        var tappedPoint = tapGestureRecognizer.location(in: nil)
        tappedPoint.x = self.frame.width - 50
        setUpMenu(tappedPoint: tappedPoint)
    }
    
    
    /// Set up views of cell
    /// - Parameters:
    ///   - schedule: current schedule meeting
    ///   - user: user who scheduled the meeting
    func setUpCell(schedule: Schedule, user: ScheduleUser) {
        meetingId = schedule.pk
        meetingTitleLabel.text = ("\(schedule.title) ") + (schedule.description)
        dateLabel.text = schedule.startTime.getFormattedDateWithTime()
        timeLabel.text = schedule.duration
        usernameLabel.text = user.displayName
    }
}

extension MeetingDetailsTableViewCell: ChidoriDelegate {
    
    func didSelectAction(_ action: UIAction) {
        actionMappings[action.identifier]?(action)
    }
    
    
    /// pop up menu to copy link, edit and cancel meeting
    /// - Parameter tappedPoint: origin position for menu
    func setUpMenu(tappedPoint: CGPoint) {
        let menu: UIMenu = {
            var postActions: [UIAction] = []
            
            let copyLinkIdentifier = UIAction.Identifier("copyLink")
            actionMappings[copyLinkIdentifier] = actionHandler(action:)
            let copyLinkAction = UIAction(title: "Copy Link", identifier: copyLinkIdentifier, handler: actionHandler(action:))
            postActions.append(copyLinkAction)
            
            let editIdentifier = UIAction.Identifier("edit")
            actionMappings[editIdentifier] = actionHandler(action:)
            let editAction = UIAction(title: "Edit", identifier: editIdentifier, handler: actionHandler(action:))
            postActions.append(editAction)
            
            let cancelIdentifier = UIAction.Identifier("cancel")
            actionMappings[cancelIdentifier] = openCancelMeetingDialog(action:)
            let cancelAction = UIAction(title: "Cancel", identifier: cancelIdentifier, handler: openCancelMeetingDialog(action:))
            postActions.append(cancelAction)
            
            let postMenu = UIMenu(title: "", image: nil, identifier: nil, options: [.displayInline], children: postActions)
            return postMenu
        }()
        
        func actionHandler(action: UIAction) { }
        
        func openCancelMeetingDialog(action: UIAction) {
            presentDialogDelegate?.presentDialog(meetingId: meetingId)
        }
        
        let chidoriMenu = ChidoriMenu(menu: menu, summonPoint: tappedPoint)
        chidoriMenu.delegate = self
        presentDialogDelegate?.presentMenu(chidoriMenu: chidoriMenu)
    }
}
