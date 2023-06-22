//
//  UpcomingMeetingsViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/06/23.
//

import UIKit
import PanModal
import SkeletonView

protocol Presentable {
    func presentDialog(meetingId: Int)
    func presentMenu(chidoriMenu: ChidoriMenu)
    func cancelMeetingResponse(response: CancelMeetingResponse)
}

class UpcomingMeetingsViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet private weak var meetingTableView: UITableView!
    @IBOutlet private weak var addMeetingButton: UIButton!

    //MARK: - Variables
    private let upcomingMeetingsViewModel = UpcomingMeetingsViewModel()
    private let pullToRefresh = UIRefreshControl()
    private let userToken = UserDefaults.standard.string(forKey: "userToken")
    private let limit = 7
    private var totalPage = 1
    private var currentPage = 1
    private var footerView: UIView?
    private var meetingList: [(key: String, values: [UpcomingMeetingsResult])] = []

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingMeetingsViewModel.upcomingMeetingsVC = self
        setUpView()
        loadData()
    }

    /// Set navigation bar title and right bar button item
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Upcoming Meetings"
        let rightBarMenuButton = UIBarButtonItem(image: UIImage(named: "ic_menu"), style: .plain, target: self, action: nil)
        rightBarMenuButton.tintColor = .lightGray
        navigationController?.navigationBar.topItem?.rightBarButtonItem = rightBarMenuButton
    }

    //MARK: - Functions

    /// Initial view set up
    func setUpView() {
        addMeetingButton.layer.cornerRadius = addMeetingButton.frame.height / 2
        meetingTableView.refreshControl = pullToRefresh
        pullToRefresh.addTarget(self, action: #selector(refreshData), for: .primaryActionTriggered)
        footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        let footerSpinner = UIActivityIndicatorView()
        footerSpinner.center = footerView?.center ?? CGPoint(x: 0, y: 0)
        footerSpinner.startAnimating()
        footerView?.addSubview(footerSpinner)
        meetingTableView.rowHeight = UITableView.automaticDimension
    }

    /// Call Api to get upcoming meetings detail
    func loadData() {
        upcomingMeetingsViewModel.getUpcomingMeetings(userToken: userToken ?? "", page: currentPage, limit: limit)
    }

    /// Load more data from paginated api
    func loadMoreData() {
        meetingTableView.tableFooterView = footerView
        currentPage += 1
        upcomingMeetingsViewModel.getUpcomingMeetings(userToken: userToken ?? "", page: currentPage, limit: limit)
    }

    /// sort meeting list in ascending order
    func sortMeetingList() {
        meetingList = meetingList.sorted(by: { $0.key.convertToDate().compare($1.key.convertToDate()) == .orderedAscending })
    }


    /// Get upcoming meetigns response from api call and made required changes to ui
    /// - Parameters:
    ///   - response: Key value pair of Date and Schedule meetings
    ///   - pages: Total number of pages available in paginated api
    func upcomingMeetingsResponse(response: [(key: String, values: [UpcomingMeetingsResult])], pages: Int) {
        meetingList.append(contentsOf: response)
        sortMeetingList()
        totalPage = pages
        DispatchQueue.main.async { [weak self] in
            self?.meetingTableView.reloadData()
        }
        pullToRefresh.endRefreshing()
        meetingTableView.tableFooterView = nil
    }

    /// Cancel meeting response
    ///
    /// - Parameters:
    /// - response: CancelMeetingResponse
    func cancelMeetingResponse(response: CancelMeetingResponse) {
        if (response.status == 200) {
            DispatchQueue.main.async { [weak self] in
                self?.refreshData()
            }
        } else {
            AlertHelper.showErrorMsg(message: response.message )
        }
    }
}

// MARK: - Table view data source
extension UpcomingMeetingsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        meetingList.count != 0 ? meetingList.count : 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meetingList.count != 0 ? meetingList[section].values.count : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeetingDetailsTableViewCell.identifier, for: indexPath) as? MeetingDetailsTableViewCell else { return UITableViewCell() }
        if !(meetingList.isEmpty) {
            cell.hideSkeleton()
            cell.setUpCell(schedule: meetingList[indexPath.section].values[indexPath.row].schedule, user: meetingList[indexPath.section].values[indexPath.row].user)
        } else {
            cell.showAnimatedGradientSkeleton()
        }
        cell.presentDialogDelegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == (meetingList.count - 1) && indexPath.row == meetingList[indexPath.section].values.count - 1 && currentPage < totalPage {
            loadMoreData()
        }
    }
}

// MARK: - Table view delegate
extension UpcomingMeetingsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionCell = tableView.dequeueReusableCell(withIdentifier: MeetingDateTableViewCell.identifier) as? MeetingDateTableViewCell else { return UIView() }
        if !(meetingList.isEmpty) {
            sectionCell.hideSkeleton()
            sectionCell.setDate(date: meetingList[section].key)
        } else {
            sectionCell.showAnimatedGradientSkeleton()
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

//MARK: Skeleton TableView data source & delegate
extension UpcomingMeetingsViewController: SkeletonTableViewDataSource, SkeletonTableViewDelegate {

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return MeetingDetailsTableViewCell.identifier
    }
}

//MARK: Presentable protocol conform
extension UpcomingMeetingsViewController: Presentable {

    
    /// Present options of copy link, edit and cancel for meeting
    /// - Parameter chidoriMenu: Custom Menu
    func presentMenu(chidoriMenu: ChidoriMenu) {
        self.present(chidoriMenu, animated: true)
    }
    
    /// Present bottom sheet dialog to cancel a meeting
    /// - Parameter meetingId: Id of meeting which is to be canceled
    func presentDialog(meetingId: Int) {
        dismiss(animated: true)
        let cancelDialog = CancelMeetingViewController.instatiateStoryBoard(storyboardName: "OneCloud")
        cancelDialog.setMeetingId(meetingId: meetingId)
        cancelDialog.presentableDelegate = self
        self.presentPanModal(cancelDialog)
    }
}

//MARK: - ObjC
extension UpcomingMeetingsViewController {

    @objc
    /// Refresh upcoming meetings list
    func refreshData() {
        meetingList = []
        currentPage = 1
        loadData()
    }
}
