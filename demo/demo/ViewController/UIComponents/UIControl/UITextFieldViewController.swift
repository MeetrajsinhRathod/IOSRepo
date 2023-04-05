//
//  UITextFieldViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 16/03/23.
//

import UIKit

class UITextFieldViewController: UIViewController {
    
    @IBOutlet weak var coloredField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var cornerRadiusField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coloredField.attributedPlaceholder = NSAttributedString(
            string: coloredField.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue]
        )
        coloredField.backgroundColor = UIColor.systemPink
        
        cornerRadiusField.layer.cornerRadius = 15.0
        cornerRadiusField.layer.borderWidth = 2.0
        cornerRadiusField.layer.borderColor = UIColor.black.cgColor
        cornerRadiusField.clipsToBounds = true
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let image = UIImage(named: "email.png")
        imageView.image = image
        emailField.leftView = imageView
        emailField.leftViewMode = .unlessEditing
        emailField.leftViewMode = .always
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
