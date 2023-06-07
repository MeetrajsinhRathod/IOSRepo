//
//  TableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 20/03/23.
//

import UIKit

class TableViewController: UITableViewController {

    //MARK: - Variables
    let uiComponentsDictionary = [
        "UILabel" : "UILabel",
        "UIButton" : "UIButton",
        "UITextField" : "UITextField",
        "UITextView": "UITextView",
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
        "UIImageView" : "UIImageView",
        "Image Picker" : "Image Picker",
        "UIActivityIndicator" : "Pull to refresh",
        "WKWebView" : "UILabel",
        "UISearchBar" : "UILabel",
        "Stack view" : "UIScrollView",
        "UITabBar" : "UILabel",
        "UIToolBar" : "UILabel",
        "UIBarButtons" : "UILabel",
        "UIPickerView" : "UILabel",
        "UIDatePicker" : "UILabel",
        "CLLocation" : "UILabel",
        "UIMapView" : "UILabel"
    ]
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UIComponents"
        tabBarController?.title = "UIComponents"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "NavigationCell")
        tableView.rowHeight = 50.0
    }
}

// MARK: - Table view data source
extension TableViewController {
    
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
        let uiComponents = ["UILabel", "UIButton", "UITextField", "UITextView", "UISwitch", "UISlider", "UIProgressView", "UISegmentedControl", "UIPageControl", "UIStepper", "UIScrollView", "UITableView", "UICollectionView", "Pull to refresh", "UIImageView", "Image Picker", "UIActivityIndicator", "WKWebView", "UISearchBar", "Stack view", "UITabBar", "UIToolBar", "UIBarButtons", "UIPickerView", "UIDatePicker", "CLLocation", "UIMapView"]
        cell.componentBtn.setTitle(uiComponents[indexPath.row], for: UIControl.State.normal)
        cell.componentBtn.addTarget(self, action: #selector(navigateTo(sender:)), for: UIControl.Event.touchUpInside)
        return cell
    }
}

//MARK: - Objc
extension TableViewController {
    
    @objc
    func navigateTo(sender: UIButton) {
        let uiViewStoryBoard = UIStoryboard(name: "UIView", bundle: nil)
        let uiControlStoryBoard = UIStoryboard(name: "UIControl", bundle: nil)
        let uiScrollStoryBoard = UIStoryboard(name: "UIScroll", bundle: nil)
        var viewControllerToNavigate: UIViewController
        guard let currentButtonTitle = sender.titleLabel?.text
        else { return }
        guard let identifier = uiComponentsDictionary[currentButtonTitle]
        else { return }
        
        switch sender.titleLabel?.text {
        case "UILabel", "UIProgressView", "UIImageView", "Image Picker", "UIStepper":
            viewControllerToNavigate = uiViewStoryBoard.instantiateViewController(withIdentifier: identifier)
        case "UIButton", "UITextField", "UISwitch", "UISlider", "UISegmentedControl", "UIPageControl", "Pull to refresh", "UIActivityIndicator":
            viewControllerToNavigate = uiControlStoryBoard.instantiateViewController(withIdentifier: identifier)
        case "UIScrollView", "UITableView", "UICollectionView", "UITextView", "Stack view":
            viewControllerToNavigate = uiScrollStoryBoard.instantiateViewController(withIdentifier: identifier)
        default:
            return
        }
        self.navigationController?.pushViewController(viewControllerToNavigate, animated: true)
    }
}
