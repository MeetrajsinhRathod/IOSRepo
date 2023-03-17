//
//  ViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/01/23.
//

import UIKit

class PhoneNumberViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var phoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        phoneNumber.delegate = self
        //self.phoneNumber.resignFirstResponder()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return (textField.text!.count + (string.count - range.length)) <= 10
    }
}

