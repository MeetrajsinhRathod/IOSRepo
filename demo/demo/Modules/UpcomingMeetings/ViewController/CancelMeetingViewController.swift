//
//  CancelMeetingViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 13/06/23.
//

import UIKit
import PanModal

class CancelMeetingViewController: UIViewController, StoryBoarded, PanModalPresentable {

    //MARK: - IBOutlet
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var placeholderLabel: UILabel!

    //MARK: - Variables
    private var meetingId = 0
    private let upcomingMeetingsViewModel = UpcomingMeetingsViewModel()
    private let userToken = UserDefaults.standard.string(forKey: "userToken")
    var presentableDelegate: Presentable?
    var panScrollable: UIScrollView?
    var shortFormHeight: PanModalHeight {
        return .contentHeight(320)
    }

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingMeetingsViewModel.cancelMeetingVC = self
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderWidth = 0.1
        descriptionTextView.delegate = self
    }

    //MARK: - IBAction
    @IBAction func OnCancelMeetingClick(_ sender: Any) {
        upcomingMeetingsViewModel.cancelMeeting(userToken: userToken ?? "", id: meetingId)
    }

    @IBAction func onCloseDialogClick(_ sender: Any) {
        self.dismiss(animated: true)
    }

    func setMeetingId(meetingId: Int) {
        self.meetingId = meetingId
    }

    func cancelMeetingResponse(response: CancelMeetingResponse) {
        dismiss(animated: true)
        presentableDelegate?.cancelMeetingResponse(response: response)
    }
}

//MARK: - TextView Dele
extension CancelMeetingViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderLabel.isHidden = false
        } else {
            placeholderLabel.isHidden = true
        }
    }
}
