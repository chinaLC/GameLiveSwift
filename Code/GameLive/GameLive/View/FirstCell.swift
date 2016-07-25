//
//  FirstCell.swift
//  GameLive
//
//  Created by 李晨 on 16/7/25.
//  Copyright © 2016年 lichen. All rights reserved.
//

import UIKit

class FirstCell: UICollectionViewCell {
    var image: UIImageView?
    var title: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImageView(frame: CGRectMake(0, 0, self.frame.width, self.frame.height - 100))
        self.addSubview(image!)
        title = UILabel(frame: CGRectMake(0, self.frame.height - 100, self.frame.width, 100))
        title?.textAlignment = .Center
        title?.textColor = UIColor.whiteColor()
        self.addSubview(title!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
