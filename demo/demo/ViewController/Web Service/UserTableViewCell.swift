//
//  UserTableViewCell.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 05/06/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet private weak var userProfileImageview: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    
    //MARK: - SetUpCell data
    func setUpCell(user: User) {
        usernameLabel.text = " \(user.first_name) \(user.last_name) "
        userProfileImageview.load(url: user.avatar)
    }
}
