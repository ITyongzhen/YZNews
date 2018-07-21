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
        
        NetWorkTool.loadHomeNewTitleData { (arr: [HomeTitleModel]) in
            print(arr)
            let titles: [String] = arr.compactMap({ (model) -> String? in
                model.name
                
            })
            self.navigationController!.navigationBar.isTranslucent = false
            
            self.view.backgroundColor = UIColor.white
            self.pageTitleView = YZPageTitleView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 40), titleNames: titles)
            self.pageTitleView?.layer.borderWidth = 2
            self.pageTitleView?.layer.borderColor = UIColor.yellow.cgColor
            self.pageTitleView?.delegate = self
            
            self.view.addSubview(self.pageTitleView!)
            
            for _ in arr{
                self.addChildViewController(HotPageViewController())
            }
            
            self.pageContentView = YZPageContentView(frame: CGRect(x: 0, y: 40, width: kScreenWidth, height: kScreenHeight - 40), childViewControllers: self.childViewControllers)
            self.pageContentView?.delegate = self
            
            self.view.addSubview(self.pageContentView!)
            
        }

        
    }
}

extension HomeViewController{
    private func layoutNavigationBar(){
//        view.backgroundColor = UIColor.yellow
        navigationVBar.backgroundColor = UIColor.white
        
        navigationItem.titleView = navigationVBar
        
    }
    
    
    func YZPageTitleViewDidSelected(atIndex index: Int) {
        pageContentView?.setIndex(index: index)
    }
    
    func pageContentViewDidEndScroll(index: Int) {
          pageTitleView?.setSelect(index: index)
    }
    
    
}
