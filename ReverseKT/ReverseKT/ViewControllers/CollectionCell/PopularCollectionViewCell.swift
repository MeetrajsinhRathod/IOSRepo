//
//  PopularCollectionViewCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var companyImage: UIImageView!
    @IBOutlet private weak var jobRole: UILabel!
    @IBOutlet private weak var companyName: UILabel!
    @IBOutlet private weak var salary: UILabel!

    override func awakeFromNib() {
        layer.cornerRadius = 20
    }
    
    func configure(job: Job) {
        companyName.text = job.companyName
        companyImage.image = job.companyImage
        jobRole.text = job.jobRole
        salary.text = job.salary
    }
}
