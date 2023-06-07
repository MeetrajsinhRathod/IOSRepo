//
//  Coordinator.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/04/23.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navController: UINavigationController {get set}
    var childCoordinator : [Coordinator] { get set }
    
    func start()
}
