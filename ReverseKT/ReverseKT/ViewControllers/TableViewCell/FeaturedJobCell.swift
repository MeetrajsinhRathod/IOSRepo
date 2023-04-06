//
//  FeaturedJobCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class FeaturedJobCell: UITableViewCell {

    @IBOutlet weak var featuredJobCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        featuredJobCollection.dataSource = self
        featuredJobCollection.delegate = self
        
        pageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "capsule.fill")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }

    @IBAction func pageChange(_ sender: Any) {
        featuredJobCollection.scrollToItem(at: IndexPath(row: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension FeaturedJobCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCollectionViewCell", for: indexPath) as? FeaturedCollectionViewCell
        else { return UICollectionViewCell() }
        
        switch indexPath.row {
            case 0:
            cell.backgroundColor = .systemIndigo
            case 1:
            cell.backgroundColor = .systemTeal
            case 2:
            cell.backgroundColor = .brown
            case 3:
            cell.backgroundColor = .orange
        default:
            cell.backgroundColor = .green
        }
        return cell
    }
}

extension FeaturedJobCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
