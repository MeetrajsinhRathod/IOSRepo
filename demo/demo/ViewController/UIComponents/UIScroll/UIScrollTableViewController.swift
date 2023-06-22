//
//  UIScrollTableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 28/03/23.
//

import UIKit

class UIScrollTableViewController: UITableViewController {
    
    // MARK: - Variables
    let uiComponentsDictionary = [
        "UITextView": "UITextView",
        "UIScrollView" : "UIScrollView",
        "UIScrollview for view zooming" : "Zomming Scroll View",
        "UITableView" : "UITable",
        "UICollectionView" : "MovieCollectionViewController",
        "Stack view" : "UIScrollView",
    ]
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "NavigationCell")
        tableView.rowHeight = 50.0
    }
}

// MARK: - Table view data source
extension UIScrollTableViewController {
    
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
        let uiComponents = ["UIScrollView", "UIScrollview for view zooming", "UITableView", "UICollectionView", "UITextView", "Stack view"]
        cell.componentBtn.setTitle(uiComponents[indexPath.row], for: UIControl.State.normal)
        cell.componentBtn.addTarget(self, action: #selector(navigateTo(sender:)), for: UIControl.Event.touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
}
// MARK: - ObjC
extension UIScrollTableViewController {
    
    @objc
    func navigateTo(sender: UIButton) {
        guard let currentButtonTitle = sender.titleLabel?.text
        else { return }
        guard let identifier = uiComponentsDictionary[currentButtonTitle]
        else { return }
        let UIScrollStoryboard = UIStoryboard(name: "UIScroll", bundle: nil)
        let viewControllerToNavigate: UIViewController = UIScrollStoryboard.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(viewControllerToNavigate, animated: true)
    }
}
