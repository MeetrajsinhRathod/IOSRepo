//
//  PopularJobCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class PopularJobCell: UITableViewCell {

    @IBOutlet weak var popularJobCollection: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        popularJobCollection.dataSource = self
        popularJobCollection.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
extension PopularJobCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as? PopularCollectionViewCell
        else { return UICollectionViewCell() }
        
        if indexPath.row % 2 != 0 {
            cell.jobRole.text = "Jr Executive"
            cell.companyName.text = "Pinterest"
            cell.salary.text = "$96,000/y"
            cell.configure(name: "Pinterest", image: UIImage(named: "Pinterest") ?? UIImage(), role: "Jr Executive", salary: "$96,000/y")
        } else {
            cell.configure(name: "Spotify", image: UIImage(named: "Spotify") ?? UIImage(), role: "Sr Developer", salary: "$115,000/y")
        }
        
        return cell
    }
}

extension PopularJobCell: UICollectionViewDelegate {
    
}

extension PopularJobCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 10, height: collectionView.frame.height)
    }}
