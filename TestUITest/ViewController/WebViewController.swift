//
//  WebViewController.swift
//  TestUITest
//
//  Created by An on 5/5/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    private let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installWebView()
        
        guard let url = URL(string: "https://en.wikipedia.org/wiki/Volleyball") else { return }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    private func installWebView() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
