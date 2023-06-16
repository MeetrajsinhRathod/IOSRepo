//
//  LogingVC.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/04/23.
//

import UIKit

class LoginVC: UIViewController, CoordinatorBoard {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var username: UITextField!
    @IBOutlet private weak var password: UITextField!
    
    //MARK: - Variable
    weak var LoginCoordinator: LoginCoordinator?
    let defaults = UserDefaults.standard
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBOutlets
    @IBAction func logIn(_ sender: Any) {
    
        if (username.text?.isEmpty == false && password.text?.isEmpty == false) {
            defaults.set(true, forKey: "userIsLoggedIn")
            defaults.set(username.text, forKey: "username")
            let homeVC = HomeVC.instatiateStoryBoard()
            homeVC.setUsername(name: username.text ?? "")
            navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}
