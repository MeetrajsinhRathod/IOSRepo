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
        let onBoardVC = OnboardingViewController.instatiateStoryBoard(storyboardName: "WebService")
        onBoardVC.onboardingCoordinator = self
        self.navController.pushViewController(onBoardVC, animated: false)
    }
    
    func navigateToLoginVC() {
        let authenticationCoordinator = AuthenticationCoordinator(navController)
        authenticationCoordinator.navigateToLoginVC()
    }
}
