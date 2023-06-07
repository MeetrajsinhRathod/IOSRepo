//
//  GroupDetailsTableViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 01/04/23.
//

import UIKit

class GroupDetailsTableViewController: UITableViewController {

    //MARK: - Variables
    var players = [
        
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
        
        let bgImg = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        bgImg.image = UIImage(named: "background")
        tableView.backgroundView = bgImg
        
        tableView.rowHeight = 65
        
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? headerCell
        else { return }
        
        guard let footerCell = tableView.dequeueReusableCell(withIdentifier: "footerCell") as? footerCell
        else { return }
        
        headerCell.backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        tableView.tableHeaderView = headerCell
        tableView.tableFooterView = footerCell
    }
}

extension GroupDetailsTableViewController {
    
    //MARK: - ObjC
    @objc
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension GroupDetailsTableViewController {
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? playerCell
        else { return UITableViewCell()}
        
        cell.set(name: players[indexPath.section][indexPath.row].name, number: players[indexPath.section][indexPath.row].phoneNumber, image: players[indexPath.section][indexPath.row].profileImage)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            players[indexPath.section].remove(at: indexPath.row)
            tableView.reloadData()
            
            if players[indexPath.section].count == 0 {
                players.remove(at: indexPath.section)
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionCell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as? SectionCell
        else { return UIView() }
        
        if section % 2 == 0 {
            sectionCell.cartImage.tintColor = .orange
        }
        
        sectionCell.cartNumber.text = "Cart - \(section + 1)"
        
        return sectionCell
    }
}
