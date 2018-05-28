//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by 이민혁 on 2018. 5. 28..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 10.0, *) {
            // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 사용자 동의 여부 창을 실행하겠다.
            let notiCenter = UNUserNotificationCenter.current()
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (didAllow, e) in }
            notiCenter.delegate = self
        } else {
            // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 이를 어플리케이션에 저장(구버전)
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(setting)
            if let localNoti = launchOptions?[UIApplicationLaunchOptionsKey.localNotification] as? UILocalNotification {
                // 알림으로 인해 앱이 실행된 경우
                print((localNoti.userInfo?["name"])!)
            }
        }
        return true
    }
    
//    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
//        print((notification.userInfo?["name"])!)
//        if application.applicationState == UIApplicationState.active {
//            // app 활성화된 상태일 때 실행 로직
//        } else if application.applicationState == .inactive {
//            // app이 비활성화 된직상태일 때 실행할 로직
//        }
//    }
    
    // app 실행 도중에 알림 메시지가 도착한 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "wakeup" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        // 알림 배너 띄워주기
        completionHandler([.alert, .badge, .sound])
    }
    
    // 사용자가 알림 메시지를 클릭했을 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup" {
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        if #available(iOS 10.0, *) { // UserNotification framework를 이용한 로컬 알림(ios 10이상)
            //알림 동의 여부 확인
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    // 알림 콘텐츠 객체
                    let nContent = UNMutableNotificationContent()
                    nContent.badge = 1
                    nContent.title = "로컬 알림 메시지"
                    nContent.subtitle = "준비된 내용이 아주 많아요! 얼른 다시 앱을 열어주세요"
                    nContent.body = "왜 나갔어요?? 어서 들어오세요!"
                    nContent.sound = UNNotificationSound.default()
                    nContent.userInfo = ["name": "ming"]
                    
                    // 알림 발송 조건 객체
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    // 알림 요청 객체
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    
                    //notification center 추가
                    UNUserNotificationCenter.current().add(request)
                } else {
                    print("사용자가 동의하지 않았어요!")
                }
            }
        } else {
            // UILocalNotification 객체를 이용한 로컬 알림(ios 9 이하)
            // 알림 설정 확인
            let setting = application.currentUserNotificationSettings
            // 알림 설정이 되어 있지 않다면 사용자가 수신할 수없음에 따라, 종료
            guard setting?.types != .none else {
                print("Can't Schedule")
                return
            }
            
            // local 알람 instance 생성
             let noti = UILocalNotification()
            noti.fireDate = Date(timeIntervalSinceNow: 10) // 10초 후
            noti.timeZone = TimeZone.autoupdatingCurrent
            noti.alertBody = "다시 접속해주세요"
            noti.alertAction = "학습하기"
            noti.applicationIconBadgeNumber = 1
            noti.soundName = UILocalNotificationDefaultSoundName
            noti.userInfo = ["name": "test"]
            
            // 알람 객체를 스케줄러에 등록
            application.scheduleLocalNotification(noti)
            
        }
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

