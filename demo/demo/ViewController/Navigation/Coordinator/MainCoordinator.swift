//
//  MainCoordinator.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/04/23.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navController: UINavigationController
    var childCoordinator: [Coordinator] = [Coordinator]()
    let userIsLoggedIn = UserDefaults.standard.bool(forKey: "userIsLoggedIn")
    
    init(_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        
        if userIsLoggedIn {
            let homeChildCoordinator = HomeCoordinator(self.navController)
            childCoordinator.append(homeChildCoordinator)
            homeChildCoordinator.mainCoordinator = self
            homeChildCoordinator.start()
        } else {
            let loginChildCoordinator = LoginCoordinator(self.navController)
            childCoordinator.append(loginChildCoordinator)
            loginChildCoordinator.mainCoordinator = self
            loginChildCoordinator.start()
        }
    }

    func removeChildCoordinator(child: Coordinator) {
        childCoordinator.removeAll { Coordinator in
            Coordinator === child
        }
    }
}
