//
//  ImageViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 23/03/23.
//

import UIKit

class ImageViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var circleImage: UIImageView!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        circleImage.layer.cornerRadius = circleImage.frame.size.width/2
        circleImage.backgroundColor = .green
        circleImage.clipsToBounds = true
        circleImage.image = UIImage(named: "The Avengers")
    }
}
