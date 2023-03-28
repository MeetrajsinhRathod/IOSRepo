//
//  ImageViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 23/03/23.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var circleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleImage.layer.cornerRadius = circleImage.frame.size.width/2
        circleImage.backgroundColor = .green
        circleImage.clipsToBounds = true
        
        circleImage.image = UIImage(named: "The Avengers")
        
        //circleImage.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
