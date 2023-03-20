//
//  ZoomingScrollViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 20/03/23.
//

import UIKit

class ZoomingScrollViewController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var mapImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
        scroll.maximumZoomScale = 5.0
        let btn = UIButton()
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

extension ZoomingScrollViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mapImage
    }
}
