//
//  AboutViewController.swift
//  BulleyeUIKIT2
//
//  Created by Владимир Дельгадильо on 20.01.2022.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "Bullseye", withExtension: "html") {
            webView.load(URLRequest(url: url))
        }
    }
    
    @IBAction func naviateToMainViewController() {
        dismiss(animated: true, completion: nil)
    }
}

