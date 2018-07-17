//
//  TabarViewController.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/13.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit
class TabarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.red
        tabBar.barTintColor = UIColor.white
        
        addChildVC()
    }
    
    func addChildVC() {
        addChildrenViewController(HomeViewController(), title: "首页", imageName: "home")
        addChildrenViewController(RedpackageViewController(), title: "", imageName: "redpackage")
        addChildrenViewController(VideoViewController(), title: "视频", imageName: "video")
        
    }
    
    
    func addChildrenViewController(_ childrenViewController: UIViewController, title: String?, imageName: String?) -> Void {
        
        childrenViewController.tabBarItem.image = UIImage(named: imageName! + "_tabbar_32x32_")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
          childrenViewController.tabBarItem.selectedImage = UIImage(named: imageName! + "_tabbar_press_32x32_")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        childrenViewController.title = title
        
        let nav = UINavigationController(rootViewController: childrenViewController)
        addChildViewController(nav)
        
    }
    
    
    
}
