//
//  AppDelegate.swift
//  Tabbar
//
//  Created by 이민혁 on 2018. 6. 18..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let tbC = self.window?.rootViewController as? UITabBarController {
            if let tbItems = tbC.tabBar.items {
//                tbItems[0].image = UIImage(named: "calendar")
//                tbItems[1].image = UIImage(named: "file-tree")
//                tbItems[2].image = UIImage(named: "photo")
                
                // 원본 이미지를 사용하고 싶을 경우 => UIImage.withRenderingMode(.alwaysOriginal)
                // defalut 값은 alwaysTemplate임. (원래 색상 정보 무시)
                tbItems[0].image = UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal)
                tbItems[1].image = UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal)
                tbItems[2].image = UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal)
                for tbItem in tbItems {
                    let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
                    tbItem.selectedImage = image
                    //탭 바 아이템별 텍스트 색상 속성 설정.. 뭔가 이상한데
//                    tbItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.gray], for: .disabled)
//                    tbItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.red], for: .selected)
                    // 이상하다 2..
//                    tbItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont.systemFont(ofSize: 15)], for: .normal)
                }
                
                // 외형 프록시 객체를 이용, 아이템의 타이틀 색상과 폰트 크기를 설정
                let tbItemProxy = UITabBarItem.appearance()
                tbItemProxy.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.red], for: .selected)
                tbItemProxy.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.gray], for: .disabled)
                tbItemProxy.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont.systemFont(ofSize: 15)], for: .normal)
                
                
                
                tbItems[0].title = "Calendar"
                tbItems[1].title = "file"
                tbItems[2].title = "photo"
            }
            tbC.tabBar.tintColor = UIColor.white
            tbC.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini")
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

