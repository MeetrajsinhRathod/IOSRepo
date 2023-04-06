//
//  JobDetailCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 06/04/23.
//

import UIKit

class JobDetailCell: UITableViewCell {

    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var jobRole: UILabel!
    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var cellContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        cellContainer.layer.cornerRadius = 30
    }
    
    func setData(job: Job) {
        companyImage.image = job.companyImage
        companyName.text = job.companyName
        jobRole.text = job.jobRole
        salary.text = job.salary
    }

}
