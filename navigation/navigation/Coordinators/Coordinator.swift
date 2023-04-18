//
//  Coordinator.swift
//  navigation
//
//  Created by Meetrajsinh Rathod on 18/04/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    func start()
    func finish()
    func finishToRoot()
}
