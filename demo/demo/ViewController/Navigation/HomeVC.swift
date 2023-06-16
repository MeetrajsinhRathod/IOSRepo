//
//  HomeVC.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/04/23.
//

import UIKit

class HomeVC: UIViewController, CoordinatorBoard {

    //MARK: - IBOutlets
    @IBOutlet private weak var userName: UILabel!
    
    //MARK: - Variables
    private var name = ""
    weak var mainCoordinator: MainCoordinator?
    weak var HomeCoordinator: HomeCoordinator?
    let defaults = UserDefaults.standard

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = name
    }
    
    //MARK: - IBAction
    @IBAction func logOut(_ sender: Any) {
        defaults.set(false, forKey: "userIsLoggedIn")
        navigationController?.popViewController(animated: true)
    }
    
    func setUsername(name: String) {
        self.name = name
    }
}
