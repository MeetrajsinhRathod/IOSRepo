//
//  URLSessionDeleteViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 07/06/23.
//

import UIKit

class URLSessionDeleteViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var deleteUserButton: UIButton!
    @IBOutlet weak var deleteStatusLabel: UILabel!
    
    //MARK: - Variables
    lazy var userViewModel = UserViewModel()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userViewModel.urlSessionDeleteViewControllerDelegate = self
    }
    
    @IBAction func onDeleteButtonClick(_ sender: Any) {
        guard let userID = Int(userIdTextField.text ?? "") else { return }
        userViewModel.deleteUser(id: userID)
    }
    
    func getResponse(response: DeleteStatus) {
        DispatchQueue.main.async {
            self.deleteStatusLabel.text = "Username: \(response.status) "
        }
    }
}
