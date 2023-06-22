//
//  URLSessionViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 05/06/23.
//

import UIKit

class URLSessionGetViewController: UIViewController, StoryBoarded {

    //MARK: - IBOutlets
    @IBOutlet private weak var userTableView: UITableView!
    
    //MARK: - Variables
    private var userData:[User] = []
    private lazy var getRequestViewModel = GetRequestViewModel()
    private var webServiceType: WebSerciveType = .urlSession
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getRequestViewModel.urlSessionGetViewControllerDelegate = self
        if (webServiceType == .urlSession) {
            getRequestViewModel.getUserDataURLSession()
        } else {
            getRequestViewModel.getUserDataAlamofire()
        }
        userTableView.dataSource = self
    }
    
    func getResponse(response: [User]) {
        userData = response
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }
    }
    
    func setWebServiceType(webService: WebSerciveType) {
        webServiceType = webService
    }
}

//MARK: - TableView DataSource
extension URLSessionGetViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell
        else { return UITableViewCell() }
        userCell.setUpCell(user: userData[indexPath.row])
        return userCell
    }
}
