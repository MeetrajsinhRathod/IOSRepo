//
//  SectionCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class SectionCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var seeMoreBtn: UIButton!
    
    // MARK: - delegate variable
    var delegate: DataPass?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBAction
    @IBAction func seeMore(_ sender: Any) {
        delegate?.seeAllJobs()
    }
    
    

}
