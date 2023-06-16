//
//  WebServicesViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 08/06/23.
//

import UIKit

class WebServicesViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var webServiceSegmentControll: UISegmentedControl!
    @IBOutlet private weak var getRequestButton: UIButton!
    @IBOutlet private weak var postRequestButton: UIButton!
    @IBOutlet private weak var putRequestButton: UIButton!
    @IBOutlet private weak var patchRequestButton: UIButton!
    @IBOutlet private weak var deleteRequestButton: UIButton!
    
    //MARK: - Variables
    private var webServiceType = WebSerciveType.urlSession
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    @IBAction func onWebServiceChange(_ sender: Any) {
        if (webServiceSegmentControll.selectedSegmentIndex == 0) {
            setButttonTitle(webServiceType: .urlSession)
            webServiceType = .urlSession
        } else {
            setButttonTitle(webServiceType: .alamofire)
            webServiceType = .alamofire
        }
    }
    
    @IBAction func onGetRequestButtonClick(_ sender: Any) {
        let urlSessionGetVC = URLSessionGetViewController.instatiateStoryBoard(storyboardName: "WebService")
        urlSessionGetVC.setWebServiceType(webService: webServiceType)
        self.present(urlSessionGetVC, animated: true)
    }
    
    @IBAction func onPostRequestButtonClick(_ sender: Any) {
        let urlSessionPostVC = URLSessionPostViewController.instatiateStoryBoard(storyboardName: "WebService")
        urlSessionPostVC.setWebServiceType(webService: webServiceType)
        self.present(urlSessionPostVC, animated: true)
    }
    
    
    @IBAction func onPutRequestButtonClick(_ sender: Any) {
        let urlSessionPutVC = URLSessionPutViewController.instatiateStoryBoard(storyboardName: "WebService")
        urlSessionPutVC.setWebServiceType(webService: webServiceType)
        self.present(urlSessionPutVC, animated: true)
    }
    
    @IBAction func onPatchRequestButtonClick(_ sender: Any) {
        let urlSessionPutVC = URLSessionPutViewController.instatiateStoryBoard(storyboardName: "WebService")
        urlSessionPutVC.setWebServiceType(webService: webServiceType)
        self.present(urlSessionPutVC, animated: true)
    }
    
    @IBAction func onDeleteRequestButtonClick(_ sender: Any) {
        let urlSessionDeleteVC = URLSessionDeleteViewController.instatiateStoryBoard(storyboardName: "WebService")
        urlSessionDeleteVC.setWebServiceType(webService: webServiceType)
        self.present(urlSessionDeleteVC, animated: true)
    }
    
    func setButttonTitle(webServiceType: WebSerciveType) {
        let title = (webServiceType == .urlSession) ? "URL Session" : "ALAMOFIRE"
        getRequestButton.setTitle("\(title) - GET", for: .normal)
        postRequestButton.setTitle("\(title) - POST", for: .normal)
        putRequestButton.setTitle("\(title) - PUT", for: .normal)
        patchRequestButton.setTitle("\(title) - PATCH", for: .normal)
        deleteRequestButton.setTitle("\(title) - DELETE", for: .normal)
    }
}
