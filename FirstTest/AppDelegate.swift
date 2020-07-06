//
//  AppDelegate.swift
//  FirstTest
//
//  Created by Zhang Ji on 2020/4/16.
//  Copyright © 2020 Zhang Ji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        //后台
        //锁屏
        print("WillResignActive");
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("EnterBackground")
    }
    

    func applicationWillEnterForeground(_ application: UIApplication) {
        //前台
        print("EnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // 前台
        //锁屏
        print("BecomeActive")
    }
    

    func applicationWillTerminate(_ application: UIApplication) {
        
        // 杀进程
    }
    
    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        print("ProtectedDataWillBecomeUnavailable")
        //锁屏
    }

    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        print("ProtectedDataDidBecomeAvailable")
        //锁屏
    }
}

