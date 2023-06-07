//
//  RefreshTableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 17/03/23.
//

import UIKit

class RefreshTableViewController: UITableViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var refresh: UIRefreshControl!
    
    //MARK: - Variables
    var tableViewElements = [String]()
    let spinner = UIActivityIndicatorView()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.backgroundColor = .black
        spinner.style = .large
        self.showSpinner()
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        headerView.backgroundColor = .opaqueSeparator
        let label = UILabel(frame: headerView.bounds)
        label.text = "Pull to refresh and see added items"
        label.textAlignment = .center
        headerView.addSubview(label)
        tableView.tableHeaderView = headerView
    }

    //MARK: - IBActions
    @IBAction func refreshTable(_ sender: UIRefreshControl) {
        let elementIndex = tableViewElements.count
        tableViewElements.append("Item \(elementIndex)")
        sender.endRefreshing()
        tableView.reloadData()
    }
    
    func showSpinner() {
        let loadingView = UIView(frame: self.view.bounds)
        loadingView.backgroundColor = .opaqueSeparator
        spinner.startAnimating()
        spinner.center = loadingView.center
        loadingView.addSubview(spinner)
        self.view.addSubview(loadingView)
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { t in
            loadingView.removeFromSuperview()
        })
    }
}

// MARK: - Table view data source
extension RefreshTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewElements.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableViewElements[indexPath.row]
        return cell
    }
}
