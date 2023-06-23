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
    private let setStatusMeetingViewModel = SetStatusSheetViewModel()
    private var keyBoardIsVisible = false
    private var status: String?
    var presentableDelegate: StatusSheetPresenter?
    var panScrollable: UIScrollView?
    var shortFormHeight: PanModalHeight {
        if keyBoardIsVisible {
            return .maxHeight
        }
        return .contentHeight(320)
    }
    
    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let status = status { descriptionTextView.text = status }
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderWidth = 0.1
        descriptionTextView.delegate = self
        descriptionTextView.setLeftRightPadding(padding: 10)
        setPlaceholder()
        addKeyboardObserver()
    }
    
    //MARK: IBAction
    @IBAction func onSaveStatusClick(_ sender: Any) {
        if !descriptionTextView.text.isEmpty {
            setStatusMeetingViewModel.setStatus(statusData: StatusData(status: descriptionTextView.text)) { [weak self] response in
                switch response.result {
                case .success(let response):
                    self?.apiSuccess(response: response.data)
                case .failure(_):
                    AlertHelper.getErrorResponse(response: response)
                }
            }
        }
    }
    
    @IBAction func onCancelClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    //MARK: - Functions
    
    /// function to observe keyboard show hide using notification center
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /// call on success of change status message api request
    /// - Parameter response:
    func apiSuccess(response: StatusData) {
        dismiss(animated: true)
        presentableDelegate?.setStatusResponse(response: response)
    }
    
    /// set status message
    func setStatus(message: String) {
        if message == " " {
            status = nil
        } else {
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

//MARK: - ObjC
extension SetStatusSheetViewController {
    
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
