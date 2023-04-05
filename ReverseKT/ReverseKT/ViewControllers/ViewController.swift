//
//  ViewController.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jobTableView: UITableView!
    
    @IBOutlet weak var searchConfigrationImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        jobTableView.dataSource = self
        jobTableView.delegate = self
        
        searchConfigrationImage.layer.cornerRadius = 10
        jobTableView.rowHeight = 200
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let featuredCell = tableView.dequeueReusableCell(withIdentifier: "FeaturedJobCell", for: indexPath) as? FeaturedJobCell
        else { return UITableViewCell() }
        
        guard let popularCell = tableView.dequeueReusableCell(withIdentifier: "PopularJobCell", for: indexPath) as? PopularJobCell
        else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            return featuredCell
        } else {
            return popularCell
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionCell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as? SectionCell
        else { return UITableViewCell() }
        
        if section == 0 {
            sectionCell.jobLabel.text = "Featured Jobs"
        } else {
            sectionCell.jobLabel.text = "Popular Jobs"
        }
        return sectionCell
    }
}
