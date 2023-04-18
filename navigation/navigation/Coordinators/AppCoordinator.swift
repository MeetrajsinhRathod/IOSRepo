//
//  AppCoordinator.swift
//  navigation
//
//  Created by Meetrajsinh Rathod on 18/04/23.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC = LoginVC.instantiate()
        loginVC.appCoordinator = self
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func finish() {
        let homeVC = HomeVC.instantiate()
        homeVC.appCoordinator = self
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func finishToRoot() {
    }
}
