//
//  DesignTabTableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 28/03/23.
//

import UIKit

class DesignTabTableViewController: UITableViewController {

    // MARK: - Variables
    private let designs = [
        "SafeDrivePod",
        "SignUpPage",
        "TodoList",
        "Golf",
        "UINavigation",
        "UIComponentsKT"
    ]
    
    //MARK: View LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.title = ""
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "UIComponents"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "NavigationCell")
        tableView.rowHeight = 50.0
    }
}

// MARK: - Table view data source
extension DesignTabTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { designs.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NavigationCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.componentBtn.setTitle(designs[indexPath.row], for: UIControl.State.normal)
        cell.componentBtn.addTarget(self, action: #selector(navigateTo(sender:)), for: UIControl.Event.touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - ObjC
extension DesignTabTableViewController {
    
    @objc
    func navigateTo(sender: UIButton) {
        guard let identifier = sender.titleLabel?.text
        else { return }
        let viewControllerToNavigate = UIStoryboard(name: (identifier), bundle: nil).instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(viewControllerToNavigate, animated: true)
    }
}
