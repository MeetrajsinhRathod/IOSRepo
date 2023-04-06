//
//  ViewController.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jobTableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchConfigrationImage: UIImageView!
    
    private var jobs = [
        Job(companyImage: UIImage(named: "Spotify") ?? UIImage(), companyName: "Spotify", jobRole: "Sr Developer", salary: "$115,000/y"),
        Job(companyImage: UIImage(named: "Pinterest") ?? UIImage(), companyName: "Pinterest", jobRole: "Jr Executive", salary: "$96,000/y"),
        Job(companyImage: UIImage(named: "BurgerKing") ?? UIImage(), companyName: "BurgerKing", jobRole: "Jr Executive", salary: "$96,000/y"),
        Job(companyImage: UIImage(named: "Beats") ?? UIImage(), companyName: "Beats", jobRole: "Product Manager", salary: "$84,000/y"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobTableView.dataSource = self
        jobTableView.delegate = self
        
        configureUI()
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
            popularCell.jobs = jobs
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
            sectionCell.seeMoreBtn.addTarget(self, action: #selector(seeMore), for: .touchUpInside)
        }
        return sectionCell
    }
}

extension ViewController {
    
    func configureUI() {
        searchConfigrationImage.layer.cornerRadius = 10
        jobTableView.rowHeight = 200
        jobTableView.separatorStyle = .none
        let searchImageView = UIView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
        let searchButton = UIButton(frame: CGRect(x: 10, y: 10, width: 22, height: 20))
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        searchButton.tintColor = .lightGray
        searchImageView.addSubview(searchButton)
        
        searchField.layer.cornerRadius = 10
        searchField.clipsToBounds = true
        searchField.leftView = searchImageView
        searchField.leftView?.largeContentImageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        searchField.leftViewMode = .always
    }
    
    @objc
    func seeMore() {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            
        guard let jobDetailVC = storyBoard.instantiateViewController(withIdentifier: "PopularJobsViewController") as? PopularJobsViewController
        else { return }
        jobDetailVC.jobs = jobs
        navigationController?.pushViewController(jobDetailVC, animated: true)
    }
}
