//
//  RefreshTableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 17/03/23.
//

import UIKit

class RefreshTableViewController: UITableViewController {

    var tableViewElements = [String]()
    @IBOutlet weak var refresh: UIRefreshControl!
    
    
    
    let spinner = UIActivityIndicatorView()
    
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

    @IBAction func refreshTable(_ sender: UIRefreshControl) {
        let elementIndex = tableViewElements.count
        tableViewElements.append("Item \(elementIndex)")
        sender.endRefreshing()
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableViewElements.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = tableViewElements[indexPath.row]
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
