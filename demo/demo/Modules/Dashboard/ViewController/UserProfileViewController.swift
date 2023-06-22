//
//  UserProfileViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 12/06/23.
//

import UIKit
import PanModal

protocol StatusSheetPresenter {
    func setStatusResponse(response: StatusData)
}

class UserProfileViewController: UIViewController {

    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var editUserProfileButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var useremailLabel: UILabel!
    @IBOutlet weak var statusMeetingView: UIView!
    @IBOutlet weak var personalInfoHelpView: UIView!
    @IBOutlet weak var logOutView: UIView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var statusMessageLabel: UILabel!
    
    //MARK: - Variables
    private var defaults = UserDefaults.standard
    private let userToken = UserDefaults.standard.string(forKey: "userToken")
    
    let userProfileViewModel = UserProfileViewModel()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        userProfileViewModel.userProfileVC = self
    }
    
    func setUpView() {
        setRoundedBorder(view: statusMeetingView)
        setRoundedBorder(view: personalInfoHelpView)
        setRoundedBorder(view: logOutView)
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.width / 2
        userProfileImageView.clipsToBounds = true
        userProfileImageView.layer.masksToBounds = true
        editUserProfileButton.layer.cornerRadius = editUserProfileButton.frame.width / 2
        editUserProfileButton.clipsToBounds = true
        editUserProfileButton.layer.borderColor = UIColor.white.cgColor
        editUserProfileButton.layer.borderWidth = 1
        editUserProfileButton.layer.masksToBounds = true
        overlayView.isHidden = false
        activityIndicator.isHidden = false
        getUserData()
        let logoutViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(logOut))
        logOutView.addGestureRecognizer(logoutViewTapGesture)
        let setStatusMessageViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(presentDialog))
        statusMeetingView.addGestureRecognizer(setStatusMessageViewTapGesture)
    }
    
    func setRoundedBorder(view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = 1
    }
    
    func getUserData() {
        userProfileViewModel.getUserData(userToken: defaults.string(forKey: "userToken") ?? "")
    }
    
    func apiSuccess(response: UserProfileData) {
        userProfileImageView.load(url: URL(string: response.avatar)!)
        usernameLabel.text = "\(response.firstName) \(response.lastName)"
        useremailLabel.text = response.email
        statusMessageLabel.text = response.status
        overlayView.isHidden = true
        activityIndicator.isHidden = true
    }
    
    @objc
    func presentDialog() {
        dismiss(animated: true)
        let setStatusDialog = SetStatusSheetViewController.instatiateStoryBoard(storyboardName: "WebService")
        setStatusDialog.presentableDelegate = self
        self.presentPanModal(setStatusDialog)
    }
    
    @objc
    func logOut() {
        defaults.set(false, forKey: "userIsLoggedIn")
        let authCoordinator = AuthenticationCoordinator(navigationController ?? UINavigationController())
        authCoordinator.logOut()
    }
}

extension UserProfileViewController: StatusSheetPresenter {
    
    func setStatusResponse(response: StatusData) {
        statusMessageLabel.text = response.status
    }
}
