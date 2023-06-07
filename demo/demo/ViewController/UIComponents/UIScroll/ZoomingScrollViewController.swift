//
//  ZoomingScrollViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 20/03/23.
//

import UIKit

class ZoomingScrollViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var mapImage: UIImageView!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
        scroll.maximumZoomScale = 5.0
    }
}

// MARK: - UIScrollView Delegate
extension ZoomingScrollViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mapImage
    }
}
