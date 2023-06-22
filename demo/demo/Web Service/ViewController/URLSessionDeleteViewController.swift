//
//  URLSessionDeleteViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 07/06/23.
//

import UIKit

class URLSessionDeleteViewController: UIViewController, StoryBoarded {

    //MARK: - IBOutlet
    @IBOutlet private weak var userIdTextField: UITextField!
    @IBOutlet private weak var deleteUserButton: UIButton!
    @IBOutlet private weak var deleteStatusLabel: UILabel!
    
    //MARK: - Variables
    private lazy var deleteRequestViewModel = DeleteRequestViewModel()
    private var webServiceType: WebSerciveType = .urlSession
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteRequestViewModel.urlSessionDeleteViewControllerDelegate = self
    }
    
    @IBAction func onDeleteButtonClick(_ sender: Any) {
        guard let userID = Int(userIdTextField.text ?? "") else { return }
        if (webServiceType == .urlSession) {
            deleteRequestViewModel.deleteUserURLSession(id: userID)
        } else {
            deleteRequestViewModel.deleteUserAlamofire(id: userID)
        }
    }
    
    func getResponse(response: DeleteStatus) {
        DispatchQueue.main.async {
            self.deleteStatusLabel.text = "Delete Status: \(response.status) "
        }
    }
    
    func setWebServiceType(webService: WebSerciveType) {
        webServiceType = webService
    }
}
