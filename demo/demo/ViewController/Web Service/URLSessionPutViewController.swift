//
//  URLSessionPutViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 06/06/23.
//

import UIKit

class URLSessionPutViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var userIDTextField: UITextField!
    //MARK: - Variables
    lazy var userViewModel = UserViewModel()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    @IBAction func onUpdateClick(_ sender: Any) {
        
    }
    
    @IBAction func putRequest(_ sender: Any) {
        guard let username = usernameTextField.text else { return }
        guard let job = jobTextField.text else { return }
        guard let userID = Int(userIDTextField.text ?? "") else { return }
        
        if (!username.isEmpty && !job.isEmpty) {
            let employee = Employee(name: username, job: job)
            userViewModel.updateUserWithPut(employee: employee, id: userID)
            userViewModel.urlSessionPutViewControllerDelegate = self
        }
    }
    
    @IBAction func patchRequest(_ sender: Any) {
        guard let username = usernameTextField.text else { return }
        guard let job = jobTextField.text else { return }
        guard let userID = Int(userIDTextField.text ?? "") else { return }
        
        if (!username.isEmpty && !job.isEmpty) {
            let employee = Employee(name: username, job: job)
            userViewModel.updateUserWithPatch(employee: employee, id: userID)
            userViewModel.urlSessionPutViewControllerDelegate = self
        }
    }
    
    func getResponse(response: Employee) {
        DispatchQueue.main.async {
            self.usernameLabel.text = "Username: \(response.name) "
            self.jobLabel.text = "Job: \(response.job) "
        }
    }
}
