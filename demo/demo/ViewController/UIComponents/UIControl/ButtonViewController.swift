//
//  ButtonViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 15/03/23.
//

import UIKit

class ButtonViewController: UIViewController {
    
    @IBOutlet weak var option: UILabel!
    @IBOutlet weak var popUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUpBtn()
        // Do any additional setup after loading the view.
    }
    
    func setPopUpBtn() {
        popUpBtn.menu = UIMenu(children: [UIAction(title: "Option-1", handler: actionHandler), UIAction(title: "Option-2", handler: actionHandler)])
    }

    func actionHandler(sender: UIAction) {
        self.option.text = "\(sender.title) is selected"
    }
}