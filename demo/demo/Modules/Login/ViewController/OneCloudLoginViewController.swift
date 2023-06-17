//
//  OneCloudLoginViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/06/23.
//

import UIKit

class OneCloudLoginViewController: UIViewController, StoryBoarded {

    //MARK: - IBOutlet
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationView: UIView!
    
    //MARK: - Variables
    var passwordToggle = false
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        registrationView.clipsToBounds = true
        registrationView.layer.cornerRadius = 20
        registrationView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        setUpLoginButton()
        let eyeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        eyeImageView.image = UIImage(systemName: "eye")
        eyeImageView.tintColor = .black
        passwordTextField.rightView = eyeImageView
        passwordTextField.rightViewMode = .always
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePassword(tapGesture:)))
        eyeImageView.isUserInteractionEnabled = true
        eyeImageView.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - IBAction
    @IBAction func onBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onLoginButtonClick(_ sender: Any) {
        //loginButton.isLoading = true
        loginButton.isEnabled = false
    }
    
    func setUpLoginButton() {
        var signInBtnConfig = UIButton.Configuration.filled()
        signInBtnConfig.baseBackgroundColor = UIColor(named: "OneCloudPrimary")
        signInBtnConfig.title = "Sign in"
        loginButton.configuration = signInBtnConfig
        loginButton.configurationUpdateHandler = { button in
            var config = button.configuration
            if button.isEnabled {
                config?.showsActivityIndicator = false
            } else {
                config?.showsActivityIndicator = true
            }
            button.configuration = config
        }
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
}
