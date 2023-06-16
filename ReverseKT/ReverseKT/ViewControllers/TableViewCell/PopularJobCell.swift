//
//  PopularJobCell.swift
//  ReverseKT
//
//  Created by Meetrajsinh Rathod on 05/04/23.
//

import UIKit

class PopularJobCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var popularJobCollection: UICollectionView!

    // MARK: - Variables
    var jobs: [Job] = [ ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        popularJobCollection.dataSource = self
        popularJobCollection.delegate = self
    }
}

// MARK: - Collection view data source
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

// MARK: - Collection view flowLayout delegate
extension PopularJobCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 5, height: collectionView.frame.height)
    }}
