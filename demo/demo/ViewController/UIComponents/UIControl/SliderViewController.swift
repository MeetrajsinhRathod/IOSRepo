//
//  SliderViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 16/03/23.
//

import UIKit

class SliderViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var customSlider: UISlider!
    
    //MARK: - Variables
    var size: CGFloat = 200
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customSlider.setThumbImage(UIImage(systemName: "sun.and.horizon")?.withTintColor(UIColor.orange), for: UIControl.State.normal)
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.center = view.center
    }
    
    //MARK: - IBActions
    @IBAction func changeSize(_ sender: UISlider) {
        imageView.frame = CGRect(x: 0, y: 0,
                                 width: size*CGFloat(sizeSlider.value),
                                 height: size*CGFloat(sizeSlider.value))
        imageView.center = view.center
    }
}
