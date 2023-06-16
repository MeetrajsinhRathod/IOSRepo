//
//  UpcomingMeetingsViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/06/23.
//

import UIKit

class UpcomingMeetingsViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var meetingTableView: UITableView!
    @IBOutlet weak var addMeetingButton: UIButton!
    private let pullToRefresh = UIRefreshControl()
    private let activityIndicator = UIActivityIndicatorView()
    
    //MARK: - Variables
    private var userToken = UserDefaults.standard.string(forKey: "userToken")
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        showSpinner()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Upcoming Meetings"
        let rightBarMenuButton = UIBarButtonItem(image: UIImage(named: "ic_menu"), style: .plain, target: self, action: nil)
        rightBarMenuButton.tintColor = .lightGray
        navigationController?.navigationBar.topItem?.rightBarButtonItem = rightBarMenuButton
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = nil
        navigationController?.navigationBar.topItem?.rightBarButtonItem = nil
    }
    
    func setUpView() {
        activityIndicator.backgroundColor = .black
        activityIndicator.style = .large
        activityIndicator.center = self.view.center
        addMeetingButton.layer.cornerRadius = addMeetingButton.frame.height/2
        meetingTableView.refreshControl = pullToRefresh
        pullToRefresh.addTarget(self, action: #selector(refreshData), for: .primaryActionTriggered)
    }
    
    @objc
    func refreshData() {
    }
    
    func showSpinner() {
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }
    
    func removeSpinner() {
        activityIndicator.removeFromSuperview()
    }
    
    func setToken(token: String) {
        userToken = token
    }
}

// MARK: - Table view data source
extension UpcomingMeetingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeetingDetailsTableViewCell.identifier, for: indexPath) as? MeetingDetailsTableViewCell else { return UITableViewCell() }
        return cell
    }
}

// MARK: - Table view delegate
extension UpcomingMeetingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionCell = tableView.dequeueReusableCell(withIdentifier: MeetingDateTableViewCell.identifier) as? MeetingDateTableViewCell else { return UIView() }
        return sectionCell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
