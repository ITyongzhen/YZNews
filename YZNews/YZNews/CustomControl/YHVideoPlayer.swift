//
//  YHVideoPlayer.swift
//  YHNews
//
//  Created by yh on 2018/3/27.
//  Copyright © 2018年 YH. All rights reserved.
//

import UIKit

import AVKit

class YHVideoPlayer: UIView, NibLoadable {
    
    @IBOutlet private weak var playBtn: UIButton!
    @IBOutlet private weak var currentLabel: UILabel!
    @IBOutlet private weak var totalLabel: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
    
    var url: String?
    var Item: AVPlayerItem?
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    func playVideo(urlString: String) {
        url = urlString
        Item = AVPlayerItem(url: URL(string: url!)!)
        if player != nil{
            player?.replaceCurrentItem(with: Item)
            
        }else{
             createPlayer()
        }
        Item?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status" {
            let stauts: AVPlayerItemStatus = AVPlayerItemStatus(rawValue: change! [NSKeyValueChangeKey.newKey] as! Int)!
            switch stauts{
                
            case .unknown:
                print("视频资源出现未知错误")
            case .readyToPlay:
                player?.play()
                
                let duration = CMTimeGetSeconds((Item?.duration)!)
                let second  = Int(duration) % 60
                let min = Int(duration) / 60
                self.totalLabel.text = String(format: "%02d: %02d", min, second)
                
            case .failed:
                print("item failed")
            }
        }else if keyPath == "timeControlStatus" {
            let status : AVPlayerTimeControlStatus = AVPlayerTimeControlStatus(rawValue: change! [NSKeyValueChangeKey.newKey] as! Int)!
            switch status{
                
            case .paused:
                playBtn.isSelected = false
            case .playing:
                playBtn.isSelected = true
            case .waitingToPlayAtSpecifiedRate:
                break
        }
        }
    }
    
    
      override  func awakeFromNib() {
            self.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 200)
            
        }

    
    @IBAction func playClicked(_ sender: UIButton) {
        if sender.isSelected {
            player?.pause()
        } else {
            player?.play()
        }
    }
    func createPlayer(){
        player = AVPlayer(playerItem: Item)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = self.bounds
        layer.insertSublayer(playerLayer!, at: 0)
        player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: DispatchQueue.main, using: { (time: CMTime) in
            let currentTime = CMTimeGetSeconds(time)
            let seconnd = Int(currentTime) % 60
            let minute = Int(currentTime) / 60
            
            self.currentLabel.text = String.init(format: "%02d : %02d",minute,seconnd)
            
            let duration = CMTimeGetSeconds(self.Item!.duration)
            self.progressView.progress = Float(currentTime / duration)
        })
        player?.addObserver(self, forKeyPath: "timeControlStatus", options: .new, context: nil)
        
    }
  

}

