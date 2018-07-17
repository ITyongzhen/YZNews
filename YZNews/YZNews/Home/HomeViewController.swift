//
//  HomeViewController.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/13.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, YZPageTitleViewDelegate, PageContentViewDelegate {

   
    
    private let navigationVBar = HomeNaviView.loadViewFromNib()
    var pageTitleView : YZPageTitleView?
    var pageContentView: YZPageContentView?
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutNavigationBar()
        self.navigationController!.navigationBar.isTranslucent = false

        view.backgroundColor = UIColor.white
        self.pageTitleView = YZPageTitleView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 40), titleNames: ["aa","bb","cc"])
        self.pageTitleView?.layer.borderWidth = 2
        self.pageTitleView?.layer.borderColor = UIColor.yellow.cgColor
        self.pageTitleView?.delegate = self
        
        self.view.addSubview(self.pageTitleView!)
        
        
        
        self.pageContentView = YZPageContentView(frame: CGRect(x: 0, y: 40, width: kScreenWidth, height: kScreenHeight - 40), childViewControllers: [])
        self.pageContentView?.delegate = self
        
        self.view.addSubview(self.pageContentView!)
        
        
        
        
        
        
    }
}

extension HomeViewController{
    private func layoutNavigationBar(){
        view.backgroundColor = UIColor.yellow
        navigationVBar.backgroundColor = UIColor.blue
        
        navigationItem.titleView = navigationVBar
        
    }
    
    
    func YZPageTitleViewDidSelected(atIndex index: Int) {
        pageTitleView?.setSelect(index: index)
    }
    
    func pageContentViewDidEndScroll(index: Int) {
          pageTitleView?.setSelect(index: index)
    }
    
    
}