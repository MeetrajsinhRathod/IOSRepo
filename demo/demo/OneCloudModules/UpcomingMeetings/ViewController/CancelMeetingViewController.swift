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
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var placeholderLabel: UILabel!

    //MARK: - Variables
    private var meetingId = 0
    private let upcomingMeetingsViewModel = UpcomingMeetingsViewModel()
    var presentableDelegate: Presentable?
    var panScrollable: UIScrollView?
    var keyBoardIsVisible = false
    var shortFormHeight: PanModalHeight {
        if keyBoardIsVisible {
            return .maxHeight
        }
        return .contentHeight(320)
    }

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderWidth = 0.1
        descriptionTextView.delegate = self
        descriptionTextView.setLeftRightPadding(padding: 10)
        addKeyboardObserver()
    }

    //MARK: - IBAction
    @IBAction func OnCancelMeetingClick(_ sender: Any) {
        upcomingMeetingsViewModel.cancelMeeting(id: meetingId) { [weak self] response in
            switch response.result {
            case .success(let response):
                self?.cancelMeetingResponse(response: response)
            case .failure(_):
                AlertHelper.getErrorResponse(response: response)
            }
        }
    }

    @IBAction func onCloseDialogClick(_ sender: Any) {
        self.dismiss(animated: true)
    }

    //MARK: - Functions
    func setMeetingId(meetingId: Int) {
        self.meetingId = meetingId
    }

    func cancelMeetingResponse(response: CancelMeetingResponse) {
        dismiss(animated: true)
        presentableDelegate?.cancelMeetingResponse(response: response)
    }
    
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: - TextView Delegate
extension CancelMeetingViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderLabel.isHidden = false
        } else {
            placeholderLabel.isHidden = true
        }
    }
}

//MARK: - Objc
extension CancelMeetingViewController {
    
    @objc
    func keyboardWillShow(notification: NSNotification) {
        keyBoardIsVisible = true
        panModalSetNeedsLayoutUpdate()
        panModalTransition(to: .longForm)
      }
    
    @objc
    func keyboardWillHide(notification: NSNotification) {
        keyBoardIsVisible = false
        panModalSetNeedsLayoutUpdate()
        panModalTransition(to: .shortForm)
      }
}
