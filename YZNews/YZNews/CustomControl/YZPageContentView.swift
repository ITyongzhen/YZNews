//
//  YZPageContentView.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/17.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit
protocol PageContentViewDelegate: class {
    func pageContentViewDidEndScroll(index: Int)
}


class YZPageContentView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var  collectionView: UICollectionView!
    
    var childVCs: [UIViewController]
    weak var delegate: PageContentViewDelegate?
    init(frame: CGRect, childViewControllers: [UIViewController]) {
        childVCs = childViewControllers
        super.init(frame: frame)
        initVC()
        
    }
    func initVC() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: kScreenWidth, height: self.frame.size.height)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        
        collectionView.delegate = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PageContentVC")
        
        
        
    }
    
    func setIndex(index: Int) {
        collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: UICollectionViewScrollPosition.left, animated: true)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension YZPageContentView{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageContentVC", for: indexPath)
//        cell.removeAllSubviews()
        
//        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "ide", for: indexPath)
//        cell.removeAllSubviews()
        let vc = childVCs[indexPath.row]
        vc.view.frame = cell.bounds
        
        let colorNumber: Int   =   Int(arc4random()%255 + 1)
        vc.view.backgroundColor = UIColor.init(red: CGFloat(colorNumber / 255), green: CGFloat(colorNumber / 255), blue:CGFloat(colorNumber / 255), alpha: 1)
        
        cell.addSubview(vc.view)
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.pageContentViewDidEndScroll(index: Int(scrollView.contentOffset.x / scrollView.frame.size.width))
    }
    
}
