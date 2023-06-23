//
//  AuthenticationCoordinator.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 12/06/23.
//

import UIKit


class AuthenticationCoordinator: Coordinator {
    
    var navController: UINavigationController
    var childCoordinator: [Coordinator] = [Coordinator]()
    
    init(_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        if UserDefaultHelper.isUserLoggedIn {
            navController.viewControllers.forEach { viewController in
                if viewController is OneCloudLoginViewController {
                    navController.popViewController(animated: false)
                }
            }
            navigateToHomeVC()
        } else {
            let onBoardingCoordinator = OnboardingCoordinator(self.navController)
            onBoardingCoordinator.start()
        }
    }
    
    func navigateToHomeVC() {
        navController.popToRootViewController(animated: false)
        let dashboardCoordinator = DashboardCoordinator(self.navController)
        dashboardCoordinator.start()
    }
    
    func logOut() {
        navController.popToRootViewController(animated: true)
    }
    
    func navigateToLoginVC() {
        let loginVC = OneCloudLoginViewController.instatiateStoryBoard(storyboardName: "OneCloud")
        loginVC.authenticationCoordinator = self
        self.navController.pushViewController(loginVC, animated: true)
    }
}
