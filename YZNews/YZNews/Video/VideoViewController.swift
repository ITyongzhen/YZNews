//
//  VideoViewController.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/13.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
    var myTableView: UITableView!
    var myDataSourse: [VideoModel] = []
    lazy var playerView = YHVideoPlayer.loadViewFromNib()
    var currentCell: VideoTableViewCell?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        layoutUI()
        NetWorkTool.loadVideoNewsFeeds { (arr: [VideoModel]) in
            self.myDataSourse = arr
            self.myTableView.reloadData()
        }
        
        
    }
    
    func layoutUI() {
        self.myTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        myTableView.delegate = self
        myTableView.dataSource = self
//        myTableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "myDataSourse")
        myTableView.register(UINib.init(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "myDataSourse")
        self.view.addSubview(myTableView)
    }
    
}

extension VideoViewController{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  myDataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myDataSourse", for: indexPath) as! VideoTableViewCell
        let model = myDataSourse[indexPath.row]
        cell.nameLabel.text = model.title
        cell.userLabel.text = model.name
        cell.playCountLabel.text = "\(model.read_count!)次播放"
        cell.videoImg.setImage(url: model.video_imgUrl, placeHolderImage: UIImage(named: "timg")!)
        cell.avatarImg.setImage(url: model.avatar_url, placeHolderImage: UIImage(named: "timg")!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath)
        guard cell?.subviews.contains(playerView) == false else {
            return
        }
        currentCell = (cell as! VideoTableViewCell)
        cell?.addSubview(playerView)
        playerView.playVideo(urlString: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        
        
        
    }
    
}
