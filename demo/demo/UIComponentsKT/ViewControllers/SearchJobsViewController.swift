//
//  ViewController.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

protocol DataPass {
    func seeAllJobs()
}

class SearchJobsViewController: UIViewController, DataPass {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var jobTableView: UITableView!
    @IBOutlet private weak var searchField: UITextField!
    @IBOutlet private weak var searchConfigrationImage: UIImageView!
    
    // MARK: - Variable
    private var jobs = [
        Job(companyImage: UIImage(named: "Spotify") ?? UIImage(), companyName: "Spotify", jobRole: "Sr Developer", salary: "$115,000/y"),
        Job(companyImage: UIImage(named: "Pinterest") ?? UIImage(), companyName: "Pinterest", jobRole: "Jr Executive", salary: "$96,000/y"),
        Job(companyImage: UIImage(named: "BurgerKing") ?? UIImage(), companyName: "BurgerKing", jobRole: "Jr Executive", salary: "$96,000/y"),
        Job(companyImage: UIImage(named: "Beats") ?? UIImage(), companyName: "Beats", jobRole: "Product Manager", salary: "$84,000/y"),
    ]

    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func editingDone(_ sender: Any) {
        searchField.resignFirstResponder()
    }
    
    // MARK: - Functions
    func configureUI() {
        searchConfigrationImage.layer.cornerRadius = 10
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
    
    func seeAllJobs() {
        let storyBoard = UIStoryboard(name: "UIComponentsKT", bundle: .main)
        guard let jobDetailVC = storyBoard.instantiateViewController(withIdentifier: "PopularJobsViewController") as? PopularJobsViewController
        else { return }
        jobDetailVC.jobs = jobs
        navigationController?.pushViewController(jobDetailVC, animated: true)
    }
}

// MARK: - ObjC
extension SearchJobsViewController {
    @objc
    func seeMore() {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        guard let jobDetailVC = storyBoard.instantiateViewController(withIdentifier: "PopularJobsViewController") as? PopularJobsViewController
        else { return }
        jobDetailVC.jobs = jobs
        navigationController?.pushViewController(jobDetailVC, animated: true)
    }
}

// MARK: - Table view data source
extension SearchJobsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let featuredCell = tableView.dequeueReusableCell(withIdentifier: "FeaturedJobCell", for: indexPath) as? FeaturedJobCell
            else { return UITableViewCell() }
            return featuredCell
        } else {
            guard let popularCell = tableView.dequeueReusableCell(withIdentifier: "PopularJobCell", for: indexPath) as? PopularJobCell
            else { return UITableViewCell() }
            popularCell.jobs = jobs
            return popularCell
        }
    }
}

// MARK: - Table view delegate
extension SearchJobsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionCell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as? JobSectionCell
        else { return UITableViewCell() }
        if section == 0 {
            sectionCell.jobLabel.text = "Featured Jobs"
        } else {
            sectionCell.jobLabel.text = "Popular Jobs"
            sectionCell.delegate = self
        }
        return sectionCell
    }
}
