//
//  OneCloudLoginViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/06/23.
//

import UIKit
import SSSpinnerButton

class OneCloudLoginViewController: UIViewController, StoryBoarded {

    //MARK: - IBOutlet
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var signInButton: SSSpinnerButton!
    
    //MARK: - Variables
    var passwordToggle = false
    var oneCloudViewModel = LoginViewModel()
    let defaults = UserDefaults.standard
    var authenticationCoordinator: AuthenticationCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        oneCloudViewModel.oneCloudLoginVC = self
        setUpView()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

    //MARK: - IBAction
    @IBAction func onBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    
    /// function to animate progressBar and call login api
    /// - Parameter sender: Custom spinner button
    @IBAction func onsignInButtonClick(_ sender: SSSpinnerButton) {
        signInButton.startAnimate(complete: nil)
        emailTextField.isEnabled = false
        passwordTextField.isEnabled = false
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        if (!email.isEmpty && !password.isEmpty) {
            let user = OneCloudUserLogin(email: email, password: password)
            oneCloudViewModel.loginUser(user: user)
        }
    }

    
    /// set up views
    func setUpView() {
        registrationView.clipsToBounds = true
        registrationView.layer.cornerRadius = 20
        registrationView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        let eyeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        eyeImageView.image = UIImage(systemName: "eye")
        eyeImageView.tintColor = .black
        passwordTextField.rightView = eyeImageView
        passwordTextField.rightViewMode = .always
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePassword(tapGesture:)))
        eyeImageView.isUserInteractionEnabled = true
        eyeImageView.addGestureRecognizer(tapGesture)
        #if targetEnvironment(simulator)
            emailTextField.text = "1037@devtest"
            passwordTextField.text = "Telware1234"
        #endif
    }

    /// function to call on success of login request
    func loginSuccess(response: OneCloudLoginResponse) {
        //loginButton.isEnabled = true
        signInButton.stopAnimate(complete: nil)
        emailTextField.isEnabled = true
        passwordTextField.isEnabled = true
        defaults.set(true, forKey: "userIsLoggedIn")
        defaults.set(response.data[0].token, forKey: "userToken")
        defaults.set(response.data[0].user, forKey: "userId")
        authenticationCoordinator?.start()
    }

    /// function to call on success of login request
    func loginFail() {
        signInButton.stopAnimate(complete: nil)
        emailTextField.isEnabled = true
        passwordTextField.isEnabled = true
    }
}

//MARK: - ObjC
extension OneCloudLoginViewController {

    @objc
    
    /// Function to toggle password visiblity
    /// - Parameter tapGesture: tap gesture
    func togglePassword(tapGesture: UITapGestureRecognizer) {
        guard let tappedImage = tapGesture.view as? UIImageView
            else { return }
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