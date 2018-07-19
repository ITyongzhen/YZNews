//
//  YHPageTitleView.swift
//  YZNews
//
//  Created by yongzhen on 2018/7/17.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit
class PageTitleCell: UICollectionViewCell {
    var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title = UILabel(frame: self.bounds)
        title.font = UIFont.systemFont(ofSize: 14)
        title.textAlignment = NSTextAlignment.center
        addSubview(title)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
protocol YZPageTitleViewDelegate: class {
    func YZPageTitleViewDidSelected(atIndex index: Int)
    
    
}
class YZPageTitleView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
  
    
    var collectionView : UICollectionView!
    weak var delegate: YZPageTitleViewDelegate?
    
    let dataSource: [String]
    init(frame: CGRect, titleNames: [String]) {
        dataSource = titleNames
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSelect(index: Int) {
        let theIndexPath = IndexPath(row: index, section: 0)
        let cell = collectionView.cellForItem(at: theIndexPath)
        cell?.isSelected = true
        collectionView.selectItem(at: theIndexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
    }
    
    func setupUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: 50, height: self.frame.size.height)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.brown
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PageTitleCell.self, forCellWithReuseIdentifier: "PageTitleCell")
        
        addSubview(collectionView)
        
        
        
        
    }
    
}

extension YZPageTitleView{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PageTitleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageTitleCell", for: indexPath) as! PageTitleCell
        cell.title.text = dataSource[indexPath.row]
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        self.delegate?.YZPageTitleViewDidSelected(atIndex: indexPath.row)
        
    }
    
  
    
    
}
