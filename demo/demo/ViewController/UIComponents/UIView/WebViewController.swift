//
//  WebViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 29/03/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    
    var url = URL(string: "https://google.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        webView.load(URLRequest(url: url!))
        
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.forward"), style: .plain, target: self, action: #selector(forward))
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(back))
        let refreshButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(reload))

        navigationItem.rightBarButtonItems = [forwardButton, backButton, refreshButton]
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func forward() {
        webView.goForward()
    }
    @objc func back() {
        webView.goBack()
    }
    @objc func reload() {
        webView.reload()
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
        webView.load(URLRequest(url: url!))
    }

    @IBAction func openUrl(_ sender: Any) {
        loadUrl()
    }
    
    @IBAction func search(_ sender: Any) {
        loadUrl()
    }
}
