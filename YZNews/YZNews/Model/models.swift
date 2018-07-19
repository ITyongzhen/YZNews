//
//  models.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/18.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import Foundation
struct HomeTitleModel: Codable {
    var category:String?
    var concern_id:String?
    var default_add:Int?
    var flags:Int?
    var icon_url:String?
    var name:String?
    var tip_new:Int?
    var type:Int?
    var web_url:String?
}

struct NewsModel: Decodable {
    var abstract: String?
    var article_url: String?
    var display_url: String?
}

struct VideoModel: Decodable {
    
}
