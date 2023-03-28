//
//  SignUpViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 24/03/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var checkBox: UIImageView!
    
    var passwordToggle = false
    var checkBoxToggle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        addKeyboardObserver()

    }
    
    func configureUI() {
        let mailImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let userImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let eyeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let lockImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        mailImageView.image = UIImage(named: "mail.png")
        emailTextField.leftView = mailImageView
        emailTextField.leftViewMode = .always
        
        userImageView.image = UIImage(named: "user.png")
        usernameTextField.leftView = userImageView
        usernameTextField.leftViewMode = .always
        
        eyeImageView.image = UIImage(systemName: "eye")
        eyeImageView.tintColor = .black
        passwordTextField.rightView = eyeImageView
        passwordTextField.rightViewMode = .always
        
        lockImageView.image = UIImage(named: "lock.png")
        passwordTextField.leftView = lockImageView
        passwordTextField.leftViewMode = .always
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: emailTextField.frame.height - 0.5 - 0.5, width: emailTextField.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x: 0, y: usernameTextField.frame.height - 0.5, width: usernameTextField.frame.width, height: 1)
        bottomLine2.backgroundColor = UIColor.gray.cgColor
        
        let bottomLine3 = CALayer()
        bottomLine3.frame = CGRect(x: 0, y: passwordTextField.frame.height - 0.5, width: passwordTextField.frame.width, height: 1)
        bottomLine3.backgroundColor = UIColor.gray.cgColor
        
        emailTextField.borderStyle = .none
        usernameTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        
        emailTextField.layer.addSublayer(bottomLine)
        usernameTextField.layer.addSublayer(bottomLine2)
        passwordTextField.layer.addSublayer(bottomLine3)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePassword(tapGesture:)))
        eyeImageView.isUserInteractionEnabled = true
        eyeImageView.addGestureRecognizer(tapGesture)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(toggleCheckBox(tapGesture:)))
        checkBox.isUserInteractionEnabled = true
        checkBox.addGestureRecognizer(tapGesture2)
        checkBox.tintColor = .black
    }
    
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
          return
        }
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height + 30 , right: 0.0)
      }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
      }
    
    @objc func togglePassword(tapGesture: UITapGestureRecognizer) {
        let tappedImage = tapGesture.view as! UIImageView
        
        if passwordToggle {
            passwordToggle = false
            tappedImage.image = UIImage(systemName: "eye")
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordToggle = true
            tappedImage.image = UIImage(systemName: "eye.slash.fill")
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc func toggleCheckBox(tapGesture: UITapGestureRecognizer) {
        let tappedImage = tapGesture.view as! UIImageView
        
        if checkBoxToggle {
            checkBoxToggle = false
            tappedImage.image = UIImage(systemName: "square")
        } else {
            checkBoxToggle = true
            tappedImage.image = UIImage(systemName: "checkmark.square")
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
