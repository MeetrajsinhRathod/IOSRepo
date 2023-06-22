//
//  OnboardingViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 21/06/23.
//

import UIKit

class OnboardingViewController: UIViewController, StoryBoarded {

    //MARK: - IBOutlet
    @IBOutlet weak var btnStartNewMeeting: UIButton!
    @IBOutlet weak var btnJoinMeeting: UIButton!
    @IBOutlet weak var btnScheduleMeeting: UIButton!
    
    //MARK: - Variables
    var onboardingCoordinator: OnboardingCoordinator?
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onLoginButtonClick(_ sender: Any) {
        onboardingCoordinator?.navigateToLoginVC()
    }
    func setUpView() {
        btnStartNewMeeting.layer.borderColor = UIColor.white.cgColor
        btnStartNewMeeting.layer.cornerRadius = 10
        btnJoinMeeting.layer.cornerRadius = 10
        btnScheduleMeeting.layer.cornerRadius = 10
    }
}
