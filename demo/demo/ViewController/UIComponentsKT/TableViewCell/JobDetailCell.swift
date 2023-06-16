//
//  JobDetailCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 06/04/23.
//

import UIKit

class JobDetailCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var companyImage: UIImageView!
    @IBOutlet private weak var jobRole: UILabel!
    @IBOutlet private weak var salary: UILabel!
    @IBOutlet private weak var companyName: UILabel!
    @IBOutlet private weak var cellContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellContainer.layer.cornerRadius = 30
    }
    
    func setData(job: Job) {
        companyImage.image = job.companyImage
        companyName.text = job.companyName
        jobRole.text = job.jobRole
        salary.text = job.salary
    }

}
