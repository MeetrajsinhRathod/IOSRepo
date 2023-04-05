//
//  PopularCollectionViewCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet var companyImage: UIImageView!
    @IBOutlet weak var jobRole: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var salary: UILabel!

    override func awakeFromNib() {
        
        self.layer.cornerRadius = 20
    }
    
    func configure(name: String, image: UIImage, role: String, salary: String) {
        self.companyName.text = name
        self.companyImage.image = image
        self.jobRole.text = role
        self.salary.text = salary
    }
}
