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
    var panScrollable: UIScrollView?
    var shortFormHeight: PanModalHeight {
        return .contentHeight(320)
    }
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderWidth = 0.1
        descriptionTextView.delegate = self
    }
    
    
    @IBAction func onCloseDialogClick(_ sender: Any) {
        self.dismiss(animated: true)
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
