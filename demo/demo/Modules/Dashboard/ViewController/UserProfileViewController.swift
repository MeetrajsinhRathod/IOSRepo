//
//  UserProfileViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 12/06/23.
//

import UIKit

class UserProfileViewController: UIViewController {

    //MARK: - Variables
    let defaults = UserDefaults.standard
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    @IBAction func onLogOutButtonClick(_ sender: Any) {
        defaults.set(false, forKey: "userIsLoggedIn")
        let authCoordinator = AuthenticationCoordinator(navigationController ?? UINavigationController())
        authCoordinator.logOut()
    }
}
