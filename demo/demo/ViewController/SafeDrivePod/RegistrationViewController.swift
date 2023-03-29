//
//  RegistrationViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 15/03/23.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstName.becomeFirstResponder()
        firstName.addTarget(self, action: #selector(returned), for: .primaryActionTriggered)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func returned() {
        firstName.resignFirstResponder()
        lastName.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
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
