//
//  UserProfileViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 12/06/23.
//

import UIKit
import PanModal
import SkeletonView

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
    @IBOutlet weak var statusMessageLabel: UILabel!
    @IBOutlet weak var statusStackView: UIStackView!
    
    //MARK: - Variables
    private var defaults = UserDefaults.standard
    private let userToken = UserDefaults.standard.string(forKey: "userToken")
    private let userProfileViewModel = UserProfileViewModel()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        userProfileViewModel.userProfileVC = self
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Profile"
        let rightBarMenuButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: nil)
        rightBarMenuButton.tintColor = .lightGray
        navigationController?.navigationBar.topItem?.rightBarButtonItem = rightBarMenuButton
    }
    
    
    /// set up views
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
        getUserData()
        let logoutViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(logOut))
        logOutView.addGestureRecognizer(logoutViewTapGesture)
        let setStatusMessageViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(presentDialog))
        statusStackView.addGestureRecognizer(setStatusMessageViewTapGesture)
    }
    
    
    /// show loading shimmer
    func showShimmer(){
        usernameLabel.showAnimatedGradientSkeleton()
        useremailLabel.showAnimatedGradientSkeleton()
        statusMessageLabel.showAnimatedGradientSkeleton()
        userProfileImageView.showAnimatedGradientSkeleton()
    }
    
    
    /// remove loading shimmer
    func removeShimmer() {
        usernameLabel.hideSkeleton()
        useremailLabel.hideSkeleton()
        statusMessageLabel.hideSkeleton()
        userProfileImageView.hideSkeleton()
    }
    
    
    /// set rounded border for view
    /// - Parameter view: view
    func setRoundedBorder(view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = 1
    }
    
    
    /// call api request function from viewModel
    func getUserData() {
        showShimmer()
        userProfileViewModel.getUserData(userToken: defaults.string(forKey: "userToken") ?? "")
    }
    
    
    /// call on successfull data fetch of user data
    /// - Parameter response: user data
    func apiSuccess(response: UserProfileData) {
        removeShimmer()
        userProfileImageView.load(url: URL(string: response.avatar)!)
        usernameLabel.text = "\(response.firstName) \(response.lastName)"
        useremailLabel.text = response.email
        statusMessageLabel.text = response.status
    }
    
    @objc
    
    /// present dialog to set status message
    func presentDialog() {
        dismiss(animated: true)
        let setStatusDialog = SetStatusSheetViewController.instatiateStoryBoard(storyboardName: "OneCloud")
        setStatusDialog.presentableDelegate = self
        setStatusDialog.setStatus(message: statusMessageLabel.text ?? nil)
        self.presentPanModal(setStatusDialog)
    }
    
    @objc
    /// function to log out user
    func logOut() {
        defaults.set(false, forKey: "userIsLoggedIn")
        let authCoordinator = AuthenticationCoordinator(navigationController ?? UINavigationController())
        authCoordinator.logOut()
    }
}

extension UserProfileViewController: StatusSheetPresenter {
    
    /// function to set status message on successfull api request
    /// - Parameter response: status message
    func setStatusResponse(response: StatusData) {
        statusMessageLabel.text = response.status
    }
}
