//
//  SliderViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 16/03/23.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    
    var size: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.center = view.center
    }
    
    @IBAction func changeSize(_ sender: UISlider) {
        
        imageView.frame = CGRect(x: 0, y: 0,
                                 width: size*CGFloat(sizeSlider.value),
                                 height: size*CGFloat(sizeSlider.value))
        imageView.center = view.center
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
