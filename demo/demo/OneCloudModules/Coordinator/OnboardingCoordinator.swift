//
//  LoginCoordinator.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 21/06/23.
//

import UIKit

class OnboardingCoordinator: Coordinator {

    var navController: UINavigationController
    var childCoordinator: [Coordinator] = [Coordinator]()
    
    init(_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let onBoardVC = OnboardingViewController.instatiateStoryBoard(storyboardName: "OneCloud")
        onBoardVC.onboardingCoordinator = self
        self.navController.pushViewController(onBoardVC, animated: true)
    }
    
    func navigateToLoginVC() {
        let authenticationCoordinator = AuthenticationCoordinator(navController)
        authenticationCoordinator.navigateToLoginVC()
    }
    
    func popVC() {
        navController.popViewController(animated: true)
    }
}
