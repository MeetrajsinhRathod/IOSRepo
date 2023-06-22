//
//  UIViewTableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 28/03/23.
//

import UIKit

class UIViewTableViewController: UITableViewController {

    //MARK: - Variables
    let uiComponentsDictionary = [
        "UILabel" : "UILabel",
        "UIProgressView" : "UIProgressView",
        "UIStepper": "UIProgressView",
        "UIImageView" : "UIImageView",
        "Image Picker" : "Image Picker",
        "UITabBar" : "UIViewTableViewController",
        "UIToolBar" : "UIToolBar",
        "UIBarButton" : "UIToolBar",
        "UISearchBar" : "SearchBar",
        "WKWebView" : "WKWebView",
        "MapView" : "MapView"
    ]

    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "NavigationCell")
        tableView.rowHeight = 50.0
    }
}

// MARK: - Table view data source
extension UIViewTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiComponentsDictionary.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NavigationCell", for: indexPath) as? TableViewCell
        else {
            return UITableViewCell()
        }
        let uiComponents = ["UILabel", "UIProgressView", "UIStepper", "UIImageView", "Image Picker", "UITabBar", "UIToolBar", "UIBarButton", "UISearchBar", "WKWebView", "MapView"]
        cell.componentBtn.setTitle(uiComponents[indexPath.row], for: UIControl.State.normal)
        cell.componentBtn.addTarget(self, action: #selector(navigateTo(sender:)), for: UIControl.Event.touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - ObjC
extension UIViewTableViewController {
    
    @objc
    func navigateTo(sender: UIButton) {
        guard let currentButtonTitle = sender.titleLabel?.text
        else { return }
        guard let identifier = uiComponentsDictionary[currentButtonTitle]
        else { return }
        let uiViewStoryBoard = UIStoryboard(name: "UIView", bundle: nil)
        let viewControllerToNavigate: UIViewController = uiViewStoryBoard.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(viewControllerToNavigate, animated: true)
    }
}
