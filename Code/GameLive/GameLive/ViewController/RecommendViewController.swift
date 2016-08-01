//
//  RecommendViewController.swift
//  GameLive
//
//  Created by 李晨 on 16/7/26.
//  Copyright © 2016年 lichen. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        self.title = "推荐"
    
        
        // 创建粒子Layer
        let snowEmitter = CAEmitterLayer()
        
        // 粒子发射位置
        snowEmitter.emitterPosition = CGPointMake(120,0);
        
        // 发射源的尺寸大小
        snowEmitter.emitterSize     = self.view.bounds.size;
        
        // 发射模式
        snowEmitter.emitterMode     = kCAEmitterLayerSurface;
        
        // 发射源的形状
        snowEmitter.emitterShape    = kCAEmitterLayerLine;
        
        // 创建雪花类型的粒子
        let snowflake = CAEmitterCell()
        
        // 粒子的名字
        snowflake.name = "snow";
        
        // 粒子参数的速度乘数因子
        snowflake.birthRate = 20.0;
        snowflake.lifetime  = 120.0;
        
        // 粒子速度
        snowflake.velocity  = 10.0;
        
        // 粒子的速度范围
        snowflake.velocityRange = 10;
        
        // 粒子y方向的加速度分量
        snowflake.yAcceleration = 2;
        
        // 周围发射角度
        snowflake.emissionRange = 0.5 * CGFloat(M_PI)
        
        // 子旋转角度范围
        snowflake.spinRange = 0.25 * CGFloat(M_PI)
        snowflake.contents  = UIImage(named: "snow")
        
        
        // 设置雪花形状的粒子的颜色
        snowflake.color      = UIColor.whiteColor().CGColor
        snowflake.redRange   = 1.5;
        snowflake.greenRange = 2.2;
        snowflake.blueRange  = 2.2;
        
        snowflake.scaleRange = 0.6;
        snowflake.scale      = 0.7;
        
        snowEmitter.shadowOpacity = 1.0;
        snowEmitter.shadowRadius  = 0.0;
        snowEmitter.shadowOffset  = CGSizeMake(0.0, 0.0);
        
        // 粒子边缘的颜色
        snowEmitter.shadowColor  = UIColor.whiteColor().CGColor
        
        // 添加粒子
        snowEmitter.emitterCells = [snowflake];
        
        // 将粒子Layer添加进图层中
        self.view.layer.addSublayer(snowEmitter)
        
        // 形成遮罩
        
        let image = UIImage(named: "alpha")
        let layer = CALayer()

        layer.frame.size = self.view.bounds.size
        
        layer.contents     = image!.CGImage
        layer.position     = self.view.center
        snowEmitter.mask    = layer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
