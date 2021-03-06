//
//  AppDelegate.swift
//  JWUIKitDemo
//
//  Created by Jerry on 16/3/17.
//  Copyright © 2016年 Jerry Wong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.initAppreance()
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let widgetsListVC = WidgetsListViewController()
        let navigationController = UINavigationController(rootViewController: widgetsListVC)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }

    func initAppreance(){
        UINavigationBar.appearance().tintColor = JWConst.themeColor
        UITextField.appearance().tintColor = JWConst.themeColor
    }
}

