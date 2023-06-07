//
//  LoginCoordinator.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 10/04/23.
//

import UIKit

class LoginCoordinator : Coordinator {
    
    var navController: UINavigationController
    var childCoordinator: [Coordinator] = [Coordinator]()
    
    weak var mainCoordinator: MainCoordinator?

    init(_ navigationController: UINavigationController){
        self.navController = navigationController
    }

    func start() {
        let loginVC = LoginVC.instatiateStoryBoard()
        loginVC.LoginCoordinator = self
        self.navController.pushViewController(loginVC, animated: false)
    }

    func navigateToHomeVC() {
        let homeChildCoordinator = HomeCoordinator(self.navController)
        homeChildCoordinator.mainCoordinator = self.mainCoordinator
        mainCoordinator?.childCoordinator.append(homeChildCoordinator)
        homeChildCoordinator.start()
    }
}
