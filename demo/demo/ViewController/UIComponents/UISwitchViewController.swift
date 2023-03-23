//
//  UISwitchViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 16/03/23.
//

import UIKit

class UISwitchViewController: UIViewController {

    @IBOutlet weak var switchToggle: UISwitch!
    
    @IBOutlet weak var customSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customSwitch.thumbTintColor = UIColor(patternImage: UIImage(named: "DropDown.png") ?? UIImage())
        
        customSwitch.onImage = UIImage(named: "monkey.png")
        customSwitch.offImage = UIImage(named: "dog.png")
        customSwitch.onTintColor = .cyan

    }
    @IBAction func turnOnDarkMode(_ sender: UISwitch) {
        if switchToggle.isOn {
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
