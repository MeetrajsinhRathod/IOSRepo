//
//  UIControlTableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 28/03/23.
//

import UIKit

class UIControlTableViewController: UITableViewController {

    //MARK: - Variables
    let uiComponentsDictionary = [
        "UIButton" : "UIButton",
        "UITextField" : "UITextField",
        "UISwitch" : "UISwitch",
        "UISlider": "UISlider",
        "UISegmentedControl" : "UISegmentedControl",
        "UIPageControl" : "UISegmentedControl",
        "Pull to refresh" : "Pull to refresh",
        "UIActivityIndicator" : "Pull to refresh",
        "UIPicker" : "UIPicker",
        "DatePicker" : "DatePicker"
    ]
    
    //MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "NavigationCell")
        tableView.rowHeight = 50.0
    }
}

// MARK: - Table view data source
extension UIControlTableViewController {
    
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
        let uiComponents = ["UIButton", "UITextField", "UISwitch", "UISlider", "UISegmentedControl", "UIPageControl", "Pull to refresh", "UIActivityIndicator", "UIPicker", "DatePicker"]
        cell.componentBtn.setTitle(uiComponents[indexPath.row], for: UIControl.State.normal)
        cell.componentBtn.addTarget(self, action: #selector(navigateTo(sender:)), for: UIControl.Event.touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - ObjC
extension UIControlTableViewController {
    
    @objc
    func navigateTo(sender: UIButton) {
        guard let currentButtonTitle = sender.titleLabel?.text
        else { return }
        guard let identifier = uiComponentsDictionary[currentButtonTitle]
        else { return }
        let UIControlStoryboard = UIStoryboard(name: "UIControl", bundle: nil)
        let viewControllerToNavigate: UIViewController = UIControlStoryboard.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(viewControllerToNavigate, animated: true)
    }
}
