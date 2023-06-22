//
//  URLSessionPutViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 06/06/23.
//

import UIKit

class URLSessionPutViewController: UIViewController, StoryBoarded {
    
    //MARK: - IBOutlet
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var jobTextField: UITextField!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var jobLabel: UILabel!
    @IBOutlet private weak var userIDTextField: UITextField!
    
    //MARK: - Variables
    private lazy var updateRequestViewModel = UpdateRequestViewModel()
    private var webServiceType: WebSerciveType = .urlSession
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateRequestViewModel.urlSessionPutViewControllerDelegate = self
    }
    
    //MARK: - IBAction
    @IBAction func putRequest(_ sender: Any) {
        guard let username = usernameTextField.text else { return }
        guard let job = jobTextField.text else { return }
        guard let userID = Int(userIDTextField.text ?? "") else { return }
        
        if (!username.isEmpty && !job.isEmpty) {
            let employee = Employee(name: username, job: job)
            if (webServiceType == .urlSession) {
                updateRequestViewModel.updateUserWithPutURLSession(employee: employee, id: userID)
            } else {
                updateRequestViewModel.updateUserWithPutAlamofire(employee: employee, id: userID)
            }
        }
    }
    
    @IBAction func patchRequest(_ sender: Any) {
        guard let username = usernameTextField.text else { return }
        guard let job = jobTextField.text else { return }
        guard let userID = Int(userIDTextField.text ?? "") else { return }
        if (!username.isEmpty && !job.isEmpty) {
            let employee = Employee(name: username, job: job)
            if (webServiceType == .urlSession) {
                updateRequestViewModel.updateUserWithPatchURLSession(employee: employee, id: userID)
            } else {
                updateRequestViewModel.updateUserWithPatchAlamofire(employee: employee, id: userID)
            }
        }
    }
    
    func getResponse(response: Employee) {
        DispatchQueue.main.async {
            self.usernameLabel.text = "Username: \(response.name) "
            self.jobLabel.text = "Job: \(response.job) "
        }
    }
    
    func setWebServiceType(webService: WebSerciveType) {
        webServiceType = webService
    }
}
