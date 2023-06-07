//
//  WebViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 29/03/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    
    //MARK: - Variables
    var url = URL(string: "https://google.com")
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: (url ?? URL(string: "https://google.com"))!))
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.forward"), style: .plain, target: self, action: #selector(forward))
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(back))
        let refreshButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(reload))
        navigationItem.rightBarButtonItems = [forwardButton, backButton, refreshButton]
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        webView.allowsBackForwardNavigationGestures = true
    }
    
    //MARK: - IBActions
    @IBAction func openUrl(_ sender: Any) {
        loadUrl()
    }
    
    @IBAction func search(_ sender: Any) {
        loadUrl()
    }
    
    func loadUrl() {
        if let urlString = urlTextField.text {
            switch urlString {
            case urlString where (urlString.lowercased().hasPrefix("https://")) && (urlString.lowercased().hasSuffix(".com")) :
                url = URL(string: urlString)
                
            case urlString where (urlString.lowercased().hasPrefix("http://")) && (urlString.lowercased().hasSuffix(".com")) :
                url = URL(string: urlString)
                
            case urlString where (urlString.lowercased().hasPrefix("www.")) && (urlString.lowercased().hasSuffix(".com")) :
                url = URL(string: "https://\(urlString)")
                
            default:
                url = URL(string: "https://www.google.com/search?q=\(urlString)")
            }
        }
        webView.load(URLRequest(url: (url ?? URL(string: "https://google.com"))!))
    }
}

//MARK: - ObjC
extension WebViewController {
    
    @objc func forward() {
        webView.goForward()
    }
    @objc func back() {
        webView.goBack()
    }
    @objc func reload() {
        webView.reload()
    }
}
