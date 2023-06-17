//
//  DashboardCoordinator.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 12/06/23.
//

import UIKit

class DashboardCoordinator: Coordinator {
    
    var navController: UINavigationController
    var childCoordinator: [Coordinator] = [Coordinator]()
    
    init(_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let dashboardVC = OneCloudHomeViewController.instatiateStoryBoard(storyboardName: "WebService")
        self.navController.pushViewController(dashboardVC, animated: false)
    }
}
