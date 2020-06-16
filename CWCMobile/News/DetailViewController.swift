//
//  DetailViewController.swift
//  News
//
//  Created by David Ruvinskiy on 6/19/18.
//  Copyright © 2018 David Ruvinskiy. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: SwipingAppController {
 
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleUrl: String?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Start the activity spinner
        spinner.alpha = 1
        spinner.startAnimating()
        
        //Set delegate for the webview
        webView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Check if there's a url, if there is, then display it
        if articleUrl != nil {
            
            //Create a url object
            let url = URL(string: articleUrl!)
            
            guard url != nil else {
                return
            }
            
            //Create a request
            let request = URLRequest(url: url!)
            
            //Load the request
            webView.load(request)
        }
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        //Remove the spinber
        spinner.stopAnimating()
        spinner.alpha = 0
    }
}
