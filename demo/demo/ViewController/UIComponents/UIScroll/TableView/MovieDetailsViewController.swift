//
//  MovieDetailsViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 22/03/23.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    //MARK: - Variables
    private var name = ""
    private var image = UIImage()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        movieName.text = name
        movieImage.image = image
    }
    
    func configure(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
