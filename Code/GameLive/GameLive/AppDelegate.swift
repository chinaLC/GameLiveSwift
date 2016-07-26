//
//  AppDelegate.swift
//  GameLive
//
//  Created by 李晨 on 16/7/25.
//  Copyright © 2016年 lichen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var collectionVC: ViewController?
    var navi: UINavigationController?
    var mask: CALayer?
    var imageView: UIImageView?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        collectionVC = ViewController()
        navi = UINavigationController(rootViewController: collectionVC!)
        navi?.navigationBar.barStyle = .Black
        navi?.navigationBar.barTintColor = UIColor.lightGrayColor()
        window?.rootViewController = navi
        
        self.mask = CALayer()
        self.mask!.contents = UIImage(named: "twitter")?.CGImage
        self.mask!.contentsGravity = kCAGravityResizeAspect
        self.mask!.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        self.mask!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask!.position = CGPoint(x: self.window!.frame.size.width / 2, y: self.window!.frame.size.height / 2)
        self.navi?.view.layer.mask = mask
        
        animateMask()
        
        self.window!.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        self.window!.makeKeyAndVisible()
        UIApplication.sharedApplication().statusBarHidden = true

        return true
    }
    
    func animateMask() {
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        let initalBounds = NSValue(CGRect: mask!.bounds)
        let secondBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 90, height: 73))
        let finalBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        self.mask!.addAnimation(keyFrameAnimation, forKey: "bounds")
        
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.navi?.view.layer.mask = nil
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

