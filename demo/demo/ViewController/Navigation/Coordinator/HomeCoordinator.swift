//
//  HomeCoordinator.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 10/04/23.
//

import UIKit

class HomeCoordinator : Coordinator {
    var navController: UINavigationController
    var childCoordinator: [Coordinator] = [Coordinator]()
    
    weak var mainCoordinator: MainCoordinator?
    
    init(_ navigationController: UINavigationController){
        self.navController = navigationController
    }
    
    func start() {
        let homeVC = HomeVC.instatiateStoryBoard()
        homeVC.mainCoordinator = self.mainCoordinator
        self.navController.pushViewController(homeVC, animated: true)
    }
    
}
