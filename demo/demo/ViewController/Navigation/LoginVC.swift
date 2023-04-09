//
//  LogingVC.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/04/23.
//

import UIKit

class LoginVC: UIViewController, CoordinatorBoard {
    
    @IBOutlet private weak var username: UITextField!
    @IBOutlet private weak var password: UITextField!
    
    weak var LoginCoordinator: LoginCoordinator?
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logIn(_ sender: Any) {
    
        if (username.text?.isEmpty == false && password.text?.isEmpty == false) {
            defaults.set(true, forKey: "userIsLoggedIn")
            defaults.set(username.text, forKey: "username")
            
            LoginCoordinator?.navigateToHomeVC()
        }
    }
}
