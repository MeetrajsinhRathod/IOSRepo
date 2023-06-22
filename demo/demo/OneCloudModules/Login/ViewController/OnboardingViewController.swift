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
    
    //MARK: - IBAction
    @IBAction func onStartMeetingButtonClick(_ sender: UIButton) {
        showComingSoon()
    }
    
    @IBAction func onJoinMeetingButtonClick(_ sender: UIButton) {
        showComingSoon()
    }
    
    @IBAction func onScheduleMeetingButtonClick(_ sender: UIButton) {
        showComingSoon()
    }
    
    @IBAction func onLoginButtonClick(_ sender: UIButton) {
        onboardingCoordinator?.navigateToLoginVC()
    }
    
    @IBAction func onBackButtonClick(_ sender: UIButton) {
        onboardingCoordinator?.popVC()
    }
    
    func setUpView() {
        btnStartNewMeeting.layer.borderColor = UIColor.white.cgColor
        btnStartNewMeeting.layer.cornerRadius = 10
    }
    
    //MARK: - Functions
    func showComingSoon() {
        AlertHelper.showInfoMsg(message: "Coming Soon...")
    }
}
