//
//  GroupDetailsViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 31/03/23.
//

import UIKit

class GroupDetailsViewController: UIViewController {

    var players = [
        
        [Player(name: "Harsh", phoneNumber: "1234567890", profileImage: UIImage(named: "The Avengers")!),
        
        Player(name: "Rahul", phoneNumber: "2350847591", profileImage: UIImage(named: "Iron Man")!)],
        
        [Player(name: "Meetraj", phoneNumber: "3568289593", profileImage: UIImage(named: "Avengers Endgame")!),
        
        Player(name: "Tosif", phoneNumber: "1234567890", profileImage: UIImage(named: "The Avengers")!)],
        
        [Player(name: "Parth", phoneNumber: "2350847591", profileImage: UIImage(named: "Iron Man")!),
        
        Player(name: "Ruchit", phoneNumber: "3568289593", profileImage: UIImage(named: "Avengers Endgame")!)]
    ]
    
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var groupTextField: UITextField!
    @IBOutlet weak var saveDetailsBtn: UIButton!
    
    var currentPlayer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        playersTableView.dataSource = self
        playersTableView.delegate = self
        
        groupTextField.layer.cornerRadius = 15.0
        groupTextField.layer.borderWidth = 2.0
        groupTextField.layer.borderColor = UIColor.white.cgColor
        groupTextField.clipsToBounds = true
        
        saveDetailsBtn.layer.cornerRadius = 25.0
        saveDetailsBtn.layer.borderWidth = 2.0
        saveDetailsBtn.layer.borderColor = UIColor.red.cgColor
        
        playersTableView.rowHeight = 60

    }

}

extension GroupDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayesTableViewCell
        
        cell.set(name: players[indexPath.section][indexPath.row].name, number: players[indexPath.section][indexPath.row].phoneNumber, image: players[indexPath.section][indexPath.row].profileImage)
        
        if currentPlayer < players.count - 1 {
            currentPlayer += 1
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
//            players.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath.section][indexPath.row], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeader = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
        sectionHeader.backgroundColor = .clear
        let label = UILabel(frame: sectionHeader.bounds)
        label.text = "Cart \(section + 1)"
        label.textColor = .white
        label.textAlignment = .center
        
        label.backgroundColor = .clear
        
        let image = UIImageView(image: UIImage(named: "iconsCart"))
//        image.leftAnchor.constraint(equalTo: sectionHeader.trailingAnchor, constant: 20).isActive = true
        sectionHeader.addSubview(label)
        sectionHeader.addSubview(image)

        return sectionHeader
    }

    
    
}
