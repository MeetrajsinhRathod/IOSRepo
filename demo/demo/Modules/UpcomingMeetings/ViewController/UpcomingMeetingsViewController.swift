//
//  UpcomingMeetingsViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/06/23.
//

import UIKit
import PanModal

protocol Presentable {
    func presentDialog()
    func presentMenu(chidoriMenu: ChidoriMenu)
}

class UpcomingMeetingsViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var meetingTableView: UITableView!
    @IBOutlet weak var addMeetingButton: UIButton!
    
    //MARK: - Variables
    private let pullToRefresh = UIRefreshControl()
    private let activityIndicator = UIActivityIndicatorView()
    private var footerView: UIView?
    private let userToken = UserDefaults.standard.string(forKey: "userToken")
    private let upcomingMeetingsViewModel = UpcomingMeetingsViewModel()
    private var meetingList: [(key:String,values:[UpcomingMeetingsResult])] = []
    private var currentPage = 1
    private var totalPage = 1
    private let limit = 5
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingMeetingsViewModel.upcomingMeetingsVC = self
        setUpView()
        showSpinner()
        loadData()
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
    
    //MARK: - Functions
    func setUpView() {
        activityIndicator.backgroundColor = .black
        activityIndicator.style = .large
        activityIndicator.center = self.view.center
        addMeetingButton.layer.cornerRadius = addMeetingButton.frame.height/2
        meetingTableView.refreshControl = pullToRefresh
        pullToRefresh.addTarget(self, action: #selector(refreshData), for: .primaryActionTriggered)
        footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        let footerSpinner = UIActivityIndicatorView()
        footerSpinner.center = footerView?.center ?? CGPoint(x: 0, y: 0)
        footerSpinner.startAnimating()
        footerView?.addSubview(footerSpinner)
    }
    
    func showSpinner() {
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }
    
    func removeSpinner() {
        activityIndicator.removeFromSuperview()
    }
    
    func loadData() {
        upcomingMeetingsViewModel.getUpcomingMeetings(userToken: userToken ?? "", page: currentPage, limit: limit)
    }
    
    func loadMoreData() {
        meetingTableView.tableFooterView = footerView
        currentPage += 1
        upcomingMeetingsViewModel.getUpcomingMeetings(userToken: userToken ?? "", page: currentPage, limit: limit)
    }
    
    func sortMeetingList() {
        meetingList = meetingList.sorted(by: { $0.key.convertToDate().compare($1.key.convertToDate()) == .orderedDescending })
    }
    
    func upcomingMeetingsResponse(response: [(key:String,values:[UpcomingMeetingsResult])], pages: Int) {
        meetingList.append(contentsOf: response)
        sortMeetingList()
        totalPage = pages
        DispatchQueue.main.async { [weak self] in
            self?.meetingTableView.reloadData()
        }
        removeSpinner()
        pullToRefresh.endRefreshing()
        meetingTableView.tableFooterView = nil
    }
}

// MARK: - Table view data source
extension UpcomingMeetingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        meetingList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meetingList[section].values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeetingDetailsTableViewCell.identifier, for: indexPath) as? MeetingDetailsTableViewCell else { return UITableViewCell() }
        if !(meetingList.isEmpty) {
            cell.setUpCell(schedule: meetingList[indexPath.section].values[indexPath.row].schedule, user: meetingList[indexPath.section].values[indexPath.row].user )
        }
        cell.presentDialogDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == (meetingList.count-1) && indexPath.row == meetingList[indexPath.section].values.count - 1 && currentPage<=totalPage {
            loadMoreData()
        }
    }
}

// MARK: - Table view delegate
extension UpcomingMeetingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionCell = tableView.dequeueReusableCell(withIdentifier: MeetingDateTableViewCell.identifier) as? MeetingDateTableViewCell else { return UIView() }
        if !(meetingList.isEmpty) {
            sectionCell.setDate(date: meetingList[section].key)
        }
        return sectionCell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension UpcomingMeetingsViewController: Presentable {
    
    func presentMenu(chidoriMenu: ChidoriMenu) {
        self.present(chidoriMenu, animated: true)
    }
    
    func presentDialog() {
        dismiss(animated: true)
        let cancelDialog = CancelMeetingViewController.instatiateStoryBoard(storyboardName: "WebService")
        self.presentPanModal(cancelDialog)
    }
}

//MARK: - ObjC
extension UpcomingMeetingsViewController {
    
    @objc
    func refreshData() {
        meetingList = []
        currentPage = 1
        loadData()
    }
}
