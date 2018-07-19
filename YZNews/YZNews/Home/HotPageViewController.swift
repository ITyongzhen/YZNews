//
//  HotPageViewController.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/18.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import Foundation
import UIKit


class HotPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var tableView: UITableView!
    
    var dataSourse: [NewsModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutUI()
        
    }
    
    
    
    
    func layoutUI() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        view.addSubview(tableView)
        
        
    }
    
}

extension HotPageViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSourse?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.title.text = dataSourse?[indexPath.row].abstract
        return cell
        
    }
    
}
