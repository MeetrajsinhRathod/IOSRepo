//
//  PopularJobCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class PopularJobCell: UITableViewCell {

    @IBOutlet weak var popularJobCollection: UICollectionView!

    var jobs: [Job] = [ ]
    
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
        
        cell.configure(job: jobs[indexPath.row])
        
        return cell
    }
}

extension PopularJobCell: UICollectionViewDelegate {
    
}

extension PopularJobCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 10, height: collectionView.frame.height)
    }}
