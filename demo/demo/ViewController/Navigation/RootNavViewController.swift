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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToRoot(segue: UIStoryboardSegue) {
        
    }
    

    @IBAction func navigateToFullscreen(_ sender: Any) {
        performSegue(withIdentifier: "fullscreen", sender: self)
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
