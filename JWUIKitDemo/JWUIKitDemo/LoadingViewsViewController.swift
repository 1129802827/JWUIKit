//
//  LoadingViewsViewController.swift
//  JWUIKitDemo
//
//  Created by Jerry on 16/3/28.
//  Copyright © 2016年 Jerry Wong. All rights reserved.
//

import UIKit

class LoadingViewsViewController: UIViewController, UICollectionViewDataSource {
    
    let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "JWUIKitLoadingViews"
        
        let collectionViewFlowlayout = UICollectionViewFlowLayout()
        collectionViewFlowlayout.scrollDirection = .Vertical
        collectionViewFlowlayout.minimumLineSpacing = 10
        collectionViewFlowlayout.minimumInteritemSpacing = 10
        collectionViewFlowlayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10)
        collectionViewFlowlayout.itemSize = CGSizeMake(80, 80)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: collectionViewFlowlayout)
        collectionView.alwaysBounceVertical = true
        collectionView.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = UIColor(white: 240.0 / 255.0, alpha: 1.0)
        self.view.addSubview(collectionView)
        collectionView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor(white: 220.0 / 255.0, alpha: 1.0)
        
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        
        var cellView :UIView?
        
        if indexPath.row == 0 {
            let radarLoadingView = JWRadarLoadingView(frame: CGRectMake(0, 0, 40, 40))
            cellView = radarLoadingView;
        } else if indexPath.row == 1 || indexPath.row == 2 {
            let soundLikeLoadingView = JWBarLoadingView(frame: CGRectMake(0, 0, 25, 20))
            if indexPath.row == 2 {
                soundLikeLoadingView.style = .Wave
                soundLikeLoadingView.duration = 0.2
            }
            cellView = soundLikeLoadingView
        } else if indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 {
            let circleLoadingView = JWCircleLoadingView(frame: CGRectMake(0, 0, 25, 25))
            circleLoadingView.style = JWCircleLoadingStyle(rawValue: indexPath.row - 3)!
            cellView = circleLoadingView
        } else if indexPath.row == 6 || indexPath.row == 7 {
            let lineStyle = indexPath.row == 7
            let dotCircleLoadingView = JWDotLoadingView(frame: CGRectMake(0, 0, lineStyle ? 80 : 30, 30))
            dotCircleLoadingView.style = lineStyle ? .Line : .Circle;
            cellView = dotCircleLoadingView
        }
        
        cell.tintColor = JWConst.themeColor
        cell.contentView.addSubview(cellView!)
        cellView!.center = CGPointMake(CGRectGetWidth(cell.frame) * 0.5, CGRectGetHeight(cell.frame) * 0.5)
        
        (cellView as! JWLoadingProtocol).startAnimating()
        
        return cell
    }

}
