//
//  UIKit+Extention.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/13.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadable: class {
    
}

extension NibLoadable{
   static func loadViewFromNib() -> Self {
          return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! Self
    }

    static var NibName: String{
        return String(describing: self)
    }
    
}
protocol ReusableView: class {}
extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
extension UIImageView {
    func setImage(url: String, placeHolderImage: UIImage) {
        self.image = placeHolderImage
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: URL(string: url)!)
            let img = UIImage(data: data)
            DispatchQueue.main.async {
                self.image = img
            }
        }
    }
}



