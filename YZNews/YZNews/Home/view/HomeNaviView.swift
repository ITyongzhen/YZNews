//
//  HomeNaviView.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/13.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class HomeNaviView: UIView, NibLoadable {
    
    /// 固有的大小
    override var intrinsicContentSize: CGSize {
        return UILayoutFittingExpandedSize
    }
    override var frame: CGRect{
        didSet {
            super.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 44)
        }
    }
}
