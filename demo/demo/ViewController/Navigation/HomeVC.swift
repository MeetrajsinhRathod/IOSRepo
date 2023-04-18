//
//  HomeVC.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/04/23.
//

import UIKit

class HomeVC: UIViewController, CoordinatorBoard {

    @IBOutlet private weak var userName: UILabel!
    private var name = ""
    
    weak var mainCoordinator: MainCoordinator?
    weak var HomeCoordinator: HomeCoordinator?
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = name
        //userName.text = defaults.string(forKey: "username")
    }
    
    @IBAction func logOut(_ sender: Any) {
        defaults.set(false, forKey: "userIsLoggedIn")
        navigationController?.popViewController(animated: true)
        //HomeCoordinator?.navigateToLogin()
    }
    
    func setUsername(name: String) {
        self.name = name
    }

}
