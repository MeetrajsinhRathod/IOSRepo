//
//  RegistrationViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 15/03/23.
//

import UIKit

class RegistrationViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.becomeFirstResponder()
        firstName.addTarget(self, action: #selector(returned), for: .primaryActionTriggered)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

//MARK: - ObjC
extension RegistrationViewController {
    
    @objc
    func returned() {
        firstName.resignFirstResponder()
        lastName.becomeFirstResponder()
    }
}
