//
//  MovieDetailsViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 22/03/23.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    private var name = ""
    private var image = UIImage()
    
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
