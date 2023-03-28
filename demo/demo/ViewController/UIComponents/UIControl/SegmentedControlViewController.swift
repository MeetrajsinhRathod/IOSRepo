//
//  SegmentedControlViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 16/03/23.
//

import UIKit

class SegmentedControlViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var page: UIPageControl!
    
    @IBOutlet weak var customPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "dog.png")
        page.addTarget(self, action: #selector(pageDidChange), for: .valueChanged)
        
        customPageControl.preferredIndicatorImage = UIImage(systemName: "book")
        customPageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "book.fill")
    }
    
    @objc func pageDidChange(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        
        switch currentPage {
        case 0:
            imageView.image = UIImage(named: "dog.png")
            segment.selectedSegmentIndex = page.currentPage
        case 1:
            imageView.image = UIImage(named: "cat.png")
            segment.selectedSegmentIndex = page.currentPage
        case 2:
            imageView.image = UIImage(named: "cow.png")
            segment.selectedSegmentIndex = page.currentPage
        case 3:
            imageView.image = UIImage(named: "monkey.png")
            segment.selectedSegmentIndex = page.currentPage
        default:
            debugPrint("error")
        }
        
    }
    
    @IBAction func changeAnimal(_ sender: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            imageView.image = UIImage(named: "dog.png")
            page.currentPage = segment.selectedSegmentIndex
        case 1:
            imageView.image = UIImage(named: "cat.png")
            page.currentPage = segment.selectedSegmentIndex
        case 2:
            imageView.image = UIImage(named: "cow.png")
            page.currentPage = segment.selectedSegmentIndex
        case 3:
            imageView.image = UIImage(named: "monkey.png")
            page.currentPage = segment.selectedSegmentIndex
        default:
            debugPrint("error")
        }
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
