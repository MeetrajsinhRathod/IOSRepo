//
//  PopularJobsViewController.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class PopularJobsViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var jobDetailsTableView: UITableView!
    
    // MARK: - Variables
    var jobs: [Job] = []

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Table view data source
extension PopularJobsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JobDetailCell", for: indexPath) as? JobDetailCell
        else { return UITableViewCell()}

        cell.setData(job: jobs[indexPath.row])
        return cell
    }
}
