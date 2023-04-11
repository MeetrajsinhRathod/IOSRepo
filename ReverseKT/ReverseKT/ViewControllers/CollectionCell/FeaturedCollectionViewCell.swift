//
//  FeaturedCollectionViewCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var companyImage: UIImageView!
    
    override func awakeFromNib() {
        layer.cornerRadius = 20
        companyImage.layer.cornerRadius = 10
    }
}
