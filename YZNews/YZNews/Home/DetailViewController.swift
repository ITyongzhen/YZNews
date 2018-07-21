//
//  DetailViewController.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/21.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let h5Url: String
    
    var webView: UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "详情"
        webView = UIWebView(frame: self.view.bounds)
        webView?.loadRequest(URLRequest(url: URL(string: h5Url)!))
        view.addSubview(webView!)
        
    }
    
    init(h5Url: String) {
        self.h5Url = h5Url
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
