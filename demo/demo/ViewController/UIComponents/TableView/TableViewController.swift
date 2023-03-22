//
//  TableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 20/03/23.
//

import UIKit

class TableViewController: UITableViewController {

    let uiComponentsDictionary = [
        "UILabel" : "UILabel",
        "UIButton" : "UIButton",
        "UITextField" : "UITextField",
        "UITextView": "UITextField",
        "UISwitch" : "UISwitch",
        "UISlider": "UISlider",
        "UIProgressView" : "UIProgressView",
        "UISegmentedControl" : "UISegmentedControl",
        "UIPageControl" : "UISegmentedControl",
        "UIStepper": "UIProgressView",
        "UIScrollView" : "UIScrollView",
        "UITableView" : "UITable",
        "UICollectionView" : "MovieCollectionViewController",
        "Pull to refresh" : "Pull to refresh",
        "UIImageView" : "Image Picker",
        "Image Picker" : "Image Picker",
        "UIActivityIndicator" : "UILabel",
        "WKWebView" : "UILabel",
        "UISearchBar" : "UILabel",
        "Stack view" : "UILabel",
        "UITabBar" : "UILabel",
        "UIToolBar" : "UILabel",
        "UIBarButtons" : "UILabel",
        "UIPickerView" : "UILabel",
        "UIDatePicker" : "UILabel",
        "CLLocation" : "UILabel",
        "UIMapView" : "UILabel"
    ]
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        navigationItem.title = "UIComponents"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "NavigationCell")
        tableView.rowHeight = 50.0
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return uiComponentsDictionary.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NavigationCell", for: indexPath) as? TableViewCell
        else {
            return UITableViewCell()
        }
        
        let uiComponents = ["UILabel", "UIButton", "UITextField", "UITextView", "UISwitch", "UISlider", "UIProgressView", "UISegmentedControl", "UIPageControl", "UIStepper", "UIScrollView", "UITableView", "UICollectionView", "Pull to refresh", "UIImageView", "Image Picker", "UIActivityIndicator", "WKWebView", "UISearchBar", "Stack view", "UITabBar", "UIToolBar", "UIBarButtons", "UIPickerView", "UIDatePicker", "CLLocation", "UIMapView"]
        
        cell.componentBtn.setTitle(uiComponents[indexPath.row], for: UIControl.State.normal)
        cell.componentBtn.addTarget(self, action: #selector(navigateTo(sender:)), for: UIControl.Event.touchUpInside)

        return cell
    }
    
    @objc func navigateTo(sender: UIButton) {
        let mainStoryBoard = UIStoryboard(name: "UIComponents", bundle: nil)
        
        let viewControllerToNavigate = mainStoryBoard.instantiateViewController(withIdentifier: uiComponentsDictionary[sender.titleLabel?.text ?? "UILabel"] ?? "UILabel")
        
//        let viewControllerToNavigate = mainStoryBoard.instantiateViewController(withIdentifier: uiComponentsDictionary[sender.titleLabel?.text ?? "UILabel"] ?? "UILabel")
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
