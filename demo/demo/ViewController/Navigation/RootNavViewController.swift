//
//  RootNavViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 04/04/23.
//

import UIKit

class RootNavViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let standard = UINavigationBarAppearance()
        standard.backgroundColor = .lightGray
        
        let scrollEdge = UINavigationBarAppearance()
        scrollEdge.backgroundColor = .clear
        
        navigationController?.navigationBar.standardAppearance = standard
        navigationController?.navigationBar.scrollEdgeAppearance = scrollEdge
        
        let image = UIImageView(image: UIImage(named: "monkey"))
        image.contentMode = .scaleAspectFit
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
    
    @objc func callMenu() {
    }
    
    @IBAction func goToRoot(segue: UIStoryboardSegue) {
    }
    

    @IBAction func navigateToFullscreen(_ sender: Any) {
        performSegue(withIdentifier: "fullscreen", sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
