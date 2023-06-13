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
    var oneCloudViewModel = LoginViewModel()
    let defaults = UserDefaults.standard
    var authenticationCoordinator: AuthenticationCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        oneCloudViewModel.oneCloudLoginVC = self
        setUpView()
        setUpLoginButton()
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

    @IBAction func onLoginButtonClick(_ sender: Any) {
        loginButton.isEnabled = false
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        if (!email.isEmpty && !password.isEmpty) {
            let user = OneCloudUserLogin(email: email, password: password)
            oneCloudViewModel.loginUser(user: user)
        }
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

    func loginSuccess(response: OneCloudLoginResponse) {
        loginButton.isEnabled = true
        defaults.set(true, forKey: "userIsLoggedIn")
        defaults.set(response.data[0].token, forKey: "userToken")
        authenticationCoordinator?.start()
    }

    func loginFail() {
        let alert = UIAlertController(title: "Login Failed", message: "Error occured: Unable To Log in.", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Try Again", style: .cancel)
        alert.addAction(cancel)
        self.present(alert, animated: true)
        loginButton.isEnabled = false
    }
}

//MARK: - ObjC
extension OneCloudLoginViewController {

    @objc
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
