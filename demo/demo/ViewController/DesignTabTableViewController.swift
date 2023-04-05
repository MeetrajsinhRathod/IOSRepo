//
//  DesignTabTableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 28/03/23.
//

import UIKit

class DesignTabTableViewController: UITableViewController {

    let designsDictionary = [
        "SafeDrivePod": "SafeDrivePod",
        "SignUp Page" : "SignUpPage",
        "Todo List" : "TodoList",
        "Golf" : "Golf",
        "UINavigation" : "UINavigation"
    ]
    
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return designsDictionary.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NavigationCell", for: indexPath) as? TableViewCell
        else {
            return UITableViewCell()
        }

        let designs = ["SafeDrivePod", "SignUp Page", "Todo List", "Golf", "UINavigation"]
        
        cell.componentBtn.setTitle(designs[indexPath.row], for: UIControl.State.normal)
        cell.componentBtn.addTarget(self, action: #selector(navigateTo(sender:)), for: UIControl.Event.touchUpInside)
        cell.selectionStyle = .none
        
        return cell
    }
    
    @objc func navigateTo(sender: UIButton) {
        let safeDrivePodStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpStoryboard = UIStoryboard(name: "Practice", bundle: nil)
        let todoListStoryboard = UIStoryboard(name: "TodoList", bundle: nil)
        let golfStoryboard = UIStoryboard(name: "Golf", bundle: nil)
        let navStoryboard = UIStoryboard(name: "UINavigation", bundle: nil)
        
        var viewControllerToNavigate: UIViewController
        
        guard let currentButtonTitle = sender.titleLabel?.text
        else { return }
        
        guard let identifier = designsDictionary[currentButtonTitle]
        else { return }
        
        switch sender.titleLabel?.text {
            case "SafeDrivePod":
            viewControllerToNavigate = safeDrivePodStoryboard.instantiateViewController(withIdentifier: identifier)
            case "SignUp Page":
                viewControllerToNavigate = signUpStoryboard.instantiateViewController(withIdentifier: identifier)
            
            case "Todo List":
                viewControllerToNavigate = todoListStoryboard.instantiateViewController(withIdentifier: identifier)
            
            case "Golf":
                viewControllerToNavigate = golfStoryboard.instantiateViewController(withIdentifier: identifier)
            
            case "UINavigation":
            viewControllerToNavigate = navStoryboard.instantiateViewController(withIdentifier: identifier)
            
            default:
            viewControllerToNavigate = safeDrivePodStoryboard.instantiateViewController(withIdentifier: identifier)
        }
        
        self.navigationController?.pushViewController(viewControllerToNavigate, animated: true)
        
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
