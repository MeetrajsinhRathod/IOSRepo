//
//  URLSessionViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 05/06/23.
//

import UIKit

class URLSessionGetViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var userTableView: UITableView!
    
    var userData:[User] = []
    lazy var userViewModel = UserViewModel()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userViewModel.urlSessionGetViewControllerDelegate = self
        userViewModel.getUserDataFromApi()
        userTableView.dataSource = self
    }
    
    func getResponse(response: [User]) {
        userData = response
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }
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
