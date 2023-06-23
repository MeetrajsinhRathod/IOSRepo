//
//  SignUpViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 24/03/23.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var checkBox: UIImageView!
    
    //MARK: - Variables
    var passwordToggle = false
    var checkBoxToggle = true
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addKeyboardObserver()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(recognizer)
    }
    
    //MARK: - Configure UI
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
        emailTextField.borderStyle = .none
        usernameTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        
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
}

//MARK: - ObjC
extension SignUpViewController {
    
    @objc
    func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
          return
        }
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height + 30 , right: 0.0)
      }
    
    @objc
    func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
      }
    
    @objc
    func togglePassword(tapGesture: UITapGestureRecognizer) {
        guard let tappedImage = tapGesture.view as? UIImageView
        else {return }
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
    
    @objc
    func toggleCheckBox(tapGesture: UITapGestureRecognizer) {
        guard let tappedImage = tapGesture.view as? UIImageView
        else { return}
        if checkBoxToggle {
            checkBoxToggle = false
            tappedImage.image = UIImage(systemName: "square")
        } else {
            checkBoxToggle = true
            tappedImage.image = UIImage(systemName: "checkmark.square")
        }
    }
    
    @objc func touch() {
            self.view.endEditing(true)
        }
}
