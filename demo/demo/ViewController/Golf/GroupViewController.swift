//
//  GroupViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 03/04/23.
//

import UIKit

class GroupViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var playersTableView: UITableView!
    
    //MARK: - Variables
    private var players = [
        [Player(name: "Harsh", phoneNumber: "1234567890", profileImage: UIImage(named: "The Avengers") ?? UIImage()),
        Player(name: "Rahul", phoneNumber: "2350847591", profileImage: UIImage(named: "Iron Man") ?? UIImage())],
        
        [Player(name: "Meetraj", phoneNumber: "3568289593", profileImage: UIImage(named: "Avengers Endgame") ?? UIImage()),
        Player(name: "Tosif", phoneNumber: "1234567890", profileImage: UIImage(named: "The Avengers") ?? UIImage())],
        
        [Player(name: "Parth", phoneNumber: "2350847591", profileImage: UIImage(named: "Iron Man") ?? UIImage()),
        Player(name: "Ruchit", phoneNumber: "3568289593", profileImage: UIImage(named: "Avengers Endgame") ?? UIImage())]
    ]
    
    //MARK: - View LifeCycle
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configureTable()
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Configure Table
    func configureTable() {
        playersTableView.dataSource = self
        playersTableView.delegate = self
        
        playersTableView.rowHeight = 60
        
        guard let headerCell = playersTableView.dequeueReusableCell(withIdentifier: "headerCell") as? headerCell else { return }
        guard let footerCell = playersTableView.dequeueReusableCell(withIdentifier: "footerCell") as? footerCell else { return }

        playersTableView.tableHeaderView = headerCell
        playersTableView.tableFooterView = footerCell
    }
}

//MARK: - TableView Data Source
extension GroupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? playerCell
        else { return UITableViewCell()}
        
        cell.set(name: players[indexPath.section][indexPath.row].name, number: players[indexPath.section][indexPath.row].phoneNumber, image: players[indexPath.section][indexPath.row].profileImage)
        return cell
    }
}

//MARK: - TableView Delegate
extension GroupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players[indexPath.section].remove(at: indexPath.row)
            tableView.reloadData()
            
            if players[indexPath.section].count == 0 {
                players.remove(at: indexPath.section)
                tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionCell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as? SectionCell
        else { return UIView()}
    
        if section % 2 == 0 {
            sectionCell.cartImage.tintColor = .orange
        }
        sectionCell.cartNumber.text = "Cart - \(section + 1)"
        return sectionCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
