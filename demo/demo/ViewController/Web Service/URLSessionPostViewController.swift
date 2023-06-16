//
//  URLSessionPutViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 06/06/23.
//

import UIKit

class URLSessionPostViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var jobTextField: UITextField!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var jobLabel: UILabel!
    @IBOutlet weak var loginStatusLabel: UILabel!
    
    //MARK: - Variables
    lazy var userViewModel = UserViewModel()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userViewModel.urlSessionPostViewControllerDelegate = self
    }

    //MARK: - IBAction
    @IBAction func onSubmitButtonClick(_ sender: Any) {
        
        guard let username = usernameTextField.text else { return }
        guard let job = jobTextField.text else { return }
        
        if (!username.isEmpty && !job.isEmpty) {
            let employee = Employee(name: username, job: job)
            userViewModel.addUser(employee: employee)
        }
    }
    
    @IBAction func onLoginButtonClick(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextfield.text else { return }
        
        if (!email.isEmpty && !password.isEmpty) {
            let user = UserRegister(email: email, password: password)
            userViewModel.loginUser(user: user)
        }
    }
    
    func getResponse(response: Employee) {
        DispatchQueue.main.async {
            self.usernameLabel.text = "Username: \(response.name) "
            self.jobLabel.text = "Job: \(response.job) "
        }
    }
    
    func getLoginStatus(status: String) {
        DispatchQueue.main.async {
            self.loginStatusLabel.text = status
        }
    }
}
