//
//  LoginVC.swift
//  navigation
//
//  Created by Meetrajsinh Rathod on 18/04/23.
//

import UIKit

class LoginVC: UIViewController, Storyboarded {

    var appCoordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        appCoordinator?.finish()
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
