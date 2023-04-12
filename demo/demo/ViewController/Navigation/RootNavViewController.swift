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
        
        let image = UIImageView(image: UIImage(named: "Iron Man"))
        navigationItem.titleView = image
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "heart.fill")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "heart.fill")
      
        navigationController?.navigationItem.leftItemsSupplementBackButton = true
        
        navigationItem.titleMenuProvider = { [weak self] menuElement in
            var customElement = menuElement
            customElement.append(UICommand(title: "menu 1", action: #selector(self?.callMenu)))
            return UIMenu(children: customElement)
        }
        //navigationItem.backButtonTitle = "asfjkn"
        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
