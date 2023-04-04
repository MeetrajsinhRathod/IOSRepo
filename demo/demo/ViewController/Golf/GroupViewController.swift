//
//  GroupViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 03/04/23.
//

import UIKit

class GroupViewController: UIViewController {

    private var players = [
        [Player(name: "Harsh", phoneNumber: "1234567890", profileImage: UIImage(named: "The Avengers")!),
        Player(name: "Rahul", phoneNumber: "2350847591", profileImage: UIImage(named: "Iron Man")!)],
        
        [Player(name: "Meetraj", phoneNumber: "3568289593", profileImage: UIImage(named: "Avengers Endgame")!),
        Player(name: "Tosif", phoneNumber: "1234567890", profileImage: UIImage(named: "The Avengers")!)],
        
        [Player(name: "Parth", phoneNumber: "2350847591", profileImage: UIImage(named: "Iron Man")!),
        Player(name: "Ruchit", phoneNumber: "3568289593", profileImage: UIImage(named: "Avengers Endgame")!)]
    ]
    
    @IBOutlet weak var playersTableView: UITableView!
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
//        navigationController.setToolbarHidden(false, animated: true)
        //navigationController?.setToolbarItems([UIBarButtonItem(title: "Bar button", style: .plain, target: self, action: nil)], animated: true)
        configureTable()
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func configureTable() {
        playersTableView.dataSource = self
        playersTableView.delegate = self
        
        playersTableView.rowHeight = 60
        
        let headerCell = playersTableView.dequeueReusableCell(withIdentifier: "headerCell") as! headerCell
        let footerCell = playersTableView.dequeueReusableCell(withIdentifier: "footerCell") as! footerCell

        playersTableView.tableHeaderView = headerCell
        playersTableView.tableFooterView = footerCell
    }
}

extension GroupViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! playerCell
        
        cell.set(name: players[indexPath.section][indexPath.row].name, number: players[indexPath.section][indexPath.row].phoneNumber, image: players[indexPath.section][indexPath.row].profileImage)
        return cell
    }
    
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
        let sectionCell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! SectionCell
    
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
