//
//  MovieCollectionViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 22/03/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class MovieCollectionViewController: UICollectionViewController {
    
    static let avengers = ["The Avengers", "Avengers Age of Ultron", "Avengers Infinity War", "Avengers Endgame", "The Avengers", "Avengers Age of Ultron", "Avengers Infinity War", "Avengers Endgame"]

    static let ironMan = ["Iron Man", "Iron Man 2", "Iron Man 3", "Iron Man", "Iron Man 2", "Iron Man 3"]

    let movies = [avengers, ironMan]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        navigationItem.title = "Collection view"
        collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FooterView")
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return movies.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MovieCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.movieName.text = movies[indexPath.section][indexPath.row]
        cell.movieImage.image = UIImage(named: movies[indexPath.section][indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView
            else {
                return UICollectionReusableView()
            }
            header.title.text = "Movie series - \(indexPath.section + 1)"
            header.backgroundColor = .opaqueSeparator
            return header
                    
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterView", for: indexPath) as? FooterView
            else {
                return UICollectionReusableView()
            }
                    let label = UILabel(frame: footer.bounds)
                    label.text = "Footer"
                    label.textAlignment = .center
                    footer.addSubview(label)
                    footer.backgroundColor = .opaqueSeparator

                    return footer
                    
        default:
            return UICollectionReusableView()
        }

    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movieDetailsVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
            else {
            return
        }

        movieDetailsVC.configure(name: movies[indexPath.section][indexPath.row], image: UIImage(named: movies[indexPath.section][indexPath.row]) ?? UIImage())
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
}
