//
//  URLSessionPutViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 06/06/23.
//

import UIKit

class URLSessionPostViewController: UIViewController, StoryBoarded {

    //MARK: - IBOutlet
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var jobTextField: UITextField!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var jobLabel: UILabel!
    @IBOutlet private weak var loginStatusLabel: UILabel!

    //MARK: - Variables
    private lazy var postRequestViewModel = PostRequestViewModel()
    private var webServiceType: WebSerciveType = .urlSession

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        postRequestViewModel.urlSessionPostViewControllerDelegate = self
    }

    //MARK: - IBAction
    @IBAction func onSubmitButtonClick(_ sender: Any) {
        guard let name = usernameTextField.text else { return }
        guard let job = jobTextField.text else { return }
        if (!name.isEmpty && !job.isEmpty) {
            let employee = Employee(name: name, job: job)
            if (webServiceType == .urlSession) {
                postRequestViewModel.addUserURLSession(employee: employee)
            } else {
                postRequestViewModel.addUserAlamofire(employee: employee)
            }
        }
    }

    @IBAction func onLoginButtonClick(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextfield.text else { return }
        if (!email.isEmpty && !password.isEmpty) {
            let user = UserRegister(email: email, password: password)
            if (webServiceType == .urlSession) {
                postRequestViewModel.loginUserURLSession(user: user)
            } else {
                postRequestViewModel.loginUserAlamofire(user: user)
            }
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

    func setWebServiceType(webService: WebSerciveType) {
        webServiceType = webService
    }
}
