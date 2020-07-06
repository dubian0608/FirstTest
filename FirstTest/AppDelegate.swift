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
//        UIApplication.shared.beginBackgroundTask {
//
//        }
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

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

