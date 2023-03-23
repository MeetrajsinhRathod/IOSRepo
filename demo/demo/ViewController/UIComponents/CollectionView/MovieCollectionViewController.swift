//
//  MovieCollectionViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 22/03/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class MovieCollectionViewController: UICollectionViewController {

//    let movies = ["The Avengers", "Avengers Age of Ultron", "Avengers Infinity War", "Avengers Endgame", "Iron Man", "Iron Man 2", "Iron Man 3", "The Avengers", "Avengers Age of Ultron", "Avengers Infinity War", "Avengers Endgame", "Iron Man", "Iron Man 2", "Iron Man 3", "The Avengers", "Avengers Age of Ultron", "Avengers Infinity War", "Avengers Endgame", "Iron Man", "Iron Man 2", "Iron Man 3"]
    
    static let avengers = ["The Avengers", "Avengers Age of Ultron", "Avengers Infinity War", "Avengers Endgame", "The Avengers", "Avengers Age of Ultron", "Avengers Infinity War", "Avengers Endgame"]

    static let ironMan = ["Iron Man", "Iron Man 2", "Iron Man 3", "Iron Man", "Iron Man 2", "Iron Man 3"]

    let movies = [avengers, ironMan]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        navigationItem.title = "Collection view"

        collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FooterView")
        
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return movies.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return movies[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MovieCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.movieName.text = movies[indexPath.section][indexPath.row]
        cell.movieImage.image = UIImage(named: movies[indexPath.section][indexPath.row])
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movieDetailsVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
            else {
            return
        }

        movieDetailsVC.name = movies[indexPath.section][indexPath.row]
        movieDetailsVC.image = UIImage(named: movies[indexPath.section][indexPath.row]) ?? UIImage()
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
