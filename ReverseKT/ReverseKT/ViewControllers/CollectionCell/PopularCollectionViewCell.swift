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
    
    func configure(job: Job) {
        self.companyName.text = job.companyName
        self.companyImage.image = job.companyImage
        self.jobRole.text = job.jobRole
        self.salary.text = job.salary
    }
}
