//
//  SetStatusSheetViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 21/06/23.
//

import UIKit
import PanModal

class SetStatusSheetViewController: UIViewController, StoryBoarded, PanModalPresentable {

    //MARK: IBOutlet
    @IBOutlet private weak var placeholderLabel: UILabel!
    @IBOutlet private weak var  descriptionTextView: UITextView!
    
    //MARK: Variables
    private var setStatusMeetingViewModel = SetStatusSheetViewModel()
    private let userToken = UserDefaults.standard.string(forKey: "userToken")
    private let userId = UserDefaults.standard.string(forKey: "userId")
    var status = ""
    var presentableDelegate: StatusSheetPresenter?
    var panScrollable: UIScrollView?
    var shortFormHeight: PanModalHeight {
        return .contentHeight(280)
    }
    
    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderWidth = 0.1
        descriptionTextView.delegate = self
        setStatusMeetingViewModel.setStatusSheetVC = self
        descriptionTextView.text = status
        descriptionTextView.setLeftRightPadding(padding: 10)
        setPlaceholder()
    }
    
    //MARK: IBAction
    @IBAction func onSaveStatusClick(_ sender: Any) {
        if !descriptionTextView.text.isEmpty {
            setStatusMeetingViewModel.setStatus(userId: userId ?? "", userToken: userToken ?? "", statusData: StatusData(status: descriptionTextView.text))
        }
    }

    @IBAction func onCancelClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    /// call on success of change status message api request
    /// - Parameter response: <#response description#>
    func apiSuccess(response: StatusData) {
        dismiss(animated: true)
        presentableDelegate?.setStatusResponse(response: response)
    }
    
    /// set status message
    func setStatus(message: String?) {
        if let message = message {
            status = message
        }
    }
    
    /// set placeholder in textView
    func setPlaceholder() {
        if descriptionTextView.text.isEmpty {
            placeholderLabel.isHidden = false
        } else {
            placeholderLabel.isHidden = true
        }
    }
}

//MARK: - TextView Dele
extension SetStatusSheetViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        setPlaceholder()
    }
}
