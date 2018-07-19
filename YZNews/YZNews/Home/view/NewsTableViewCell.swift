//
//  NewsTableViewCell.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/18.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func setupUI() {
        title = UILabel(frame: CGRect(x: 10, y: 10, width: self.bounds.size.width, height: self.bounds.size.height))
        title.font = UIFont.systemFont(ofSize: 12)
        title.textColor = UIColor.blue
        title.textAlignment = NSTextAlignment.left
        self.addSubview(title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
