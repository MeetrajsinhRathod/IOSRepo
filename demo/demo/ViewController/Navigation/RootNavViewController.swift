//
//  RootNavViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 04/04/23.
//

import UIKit

class RootNavViewController: UIViewController {

    //MARK: - Variables
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }
    
    //MARK: - IBAction
    @IBAction func goToRoot(segue: UIStoryboardSegue) { }
    
    @IBAction func navigateToFullscreen(_ sender: Any) {
        performSegue(withIdentifier: "fullscreen", sender: self)
    }
}

//MARK: - View Setup
extension RootNavViewController {
    
    func setUpNavigationBar() {
        let standard = UINavigationBarAppearance()
        standard.backgroundColor = .lightGray
        let scrollEdge = UINavigationBarAppearance()
        scrollEdge.backgroundColor = .clear
        let image = UIImageView(image: UIImage(named: "monkey"))
        image.contentMode = .scaleAspectFit
        navigationController?.navigationBar.standardAppearance = standard
        navigationController?.navigationBar.scrollEdgeAppearance = scrollEdge
        navigationItem.titleView = image
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "heart.fill")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "heart.fill")
        navigationController?.navigationBar.backItem?.backButtonTitle = "Designs"
        navigationController?.navigationItem.leftItemsSupplementBackButton = true
        navigationItem.titleMenuProvider = { [weak self] menuElement in
            var customElement = menuElement
            customElement.append(UICommand(title: "menu 1", action: #selector(self?.callMenu)))
            return UIMenu(children: customElement)
        }
    }
}

//MARK: - ObjC
extension RootNavViewController {
    @objc func callMenu() { print("menu1 clicked") }
}
