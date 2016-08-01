//
//  FirstCell.swift
//  GameLive
//
//  Created by 李晨 on 16/7/25.
//  Copyright © 2016年 lichen. All rights reserved.
//

import UIKit

class FirstCell: UICollectionViewCell {
//    var image: UIImageView?
//    var title: UILabel?
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Lazy Load
    lazy var image: UIImageView? = {
        let image = UIImageView(frame: CGRectMake(0, 0, self.frame.width, self.frame.height - 50))
        self.addSubview(image)
        return image
    }()
    lazy var title: UILabel? = {
        let title = UILabel(frame: CGRectMake(0, self.frame.height - 50, self.frame.width, 50))
        title.textAlignment = .Center
        title.textColor = UIColor.whiteColor()
        self.addSubview(title)
        return title
    }()
    
}
