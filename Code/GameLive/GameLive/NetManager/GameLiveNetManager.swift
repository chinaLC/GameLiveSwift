//
//  GameLiveNetManager.swift
//  GameLive
//
//  Created by 李晨 on 16/7/25.
//  Copyright © 2016年 lichen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct GameLiveNetManager {
    
    /** 获取直播栏目类型列表 */
    static func getCategories(completionHandler: (model: AnyObject) ->Void) -> AnyObject{
        
        return Alamofire.request(.GET, RequestPathManager.giveMeFullPath(.categories, other: (nil, nil))).responseJSON { response in
                if let value = response.result.value {
//                    print("JSON: \(json)")
                    completionHandler(model: CategoriesModel.parse(value))
                }
        }
    }
    
}