//
//  PopularJobsViewController.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class PopularJobsViewController: UIViewController {
    
    
    @IBOutlet weak var jobDetailsTableView: UITableView!
    
    var jobs: [Job] = []

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        jobDetailsTableView.dataSource = self
        jobDetailsTableView.delegate = self
        jobDetailsTableView.rowHeight = 100
        jobDetailsTableView.separatorStyle = .none
    }
}

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

extension PopularJobsViewController: UITableViewDelegate {
    
}
