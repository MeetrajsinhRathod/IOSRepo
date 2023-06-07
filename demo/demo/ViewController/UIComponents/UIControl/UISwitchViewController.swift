//
//  UISwitchViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 16/03/23.
//

import UIKit

class UISwitchViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var switchToggle: UISwitch!
    @IBOutlet weak var customSwitch: UISwitch!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customSwitch.thumbTintColor = UIColor(patternImage: UIImage(named: "DropDown.png") ?? UIImage())
        customSwitch.onTintColor = .cyan
    }
    
    //MARK: - IBAction
    @IBAction func turnOnDarkMode(_ sender: UISwitch) {
        if switchToggle.isOn {
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
    }
}
