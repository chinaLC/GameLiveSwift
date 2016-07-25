//
//  ViewController.swift
//  GameLive
//
//  Created by 李晨 on 16/7/25.
//  Copyright © 2016年 lichen. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.mainScreen().bounds.width
let identify = "Cell"

class ViewController: UIViewController, UICollectionViewDataSource {
    var collectionView: UICollectionView?
    var gameList: [CategoriesModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        NSOperationQueue().addOperationWithBlock {
            GameLiveNetManager.getCategories { (model) in
                if let tmpArr = model as? [AnyObject] {
                    self.gameList = (tmpArr as? [CategoriesModel])!
                    NSOperationQueue.mainQueue().addOperationWithBlock({
                        self.collectionView?.reloadData()
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    })
                }
            }
        }
        
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .Vertical
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        let width = (kScreenWidth - 30) / 2
        let height = width * 2
        layout.itemSize = CGSizeMake(width, height)
        collectionView = UICollectionView(frame: UIScreen.mainScreen().bounds, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.registerClass(FirstCell.self, forCellWithReuseIdentifier: identify)
        collectionView?.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
        self.navigationItem.title = "栏目"
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gameList.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identify, forIndexPath: indexPath) as! FirstCell
        cell.title?.text = String(self.gameList[indexPath.row].name!)
        cell.backgroundColor = UIColor.blueColor()
        //        NSOperationQueue().addOperationWithBlock {
        //            let url: NSURL? = NSURL(string: String(self.gameList[indexPath.row].image!))
        //            let data: NSData? = NSData(contentsOfURL: url!)!
        //            let image = UIImage(data: data!, scale: 1.0)
        //            NSOperationQueue.mainQueue().addOperationWithBlock({
        //                cell.image?.image = image
        //            })
        //        }
        let url: NSURL? = NSURL(string: String(self.gameList[indexPath.row].image!))
        cell.image?.sd_setImageWithURL(url!)
        
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

