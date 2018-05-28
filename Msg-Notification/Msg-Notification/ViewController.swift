//
//  ViewController.swift
//  Msg-Notification
//
//  Created by 이민혁 on 2018. 5. 28..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
    @IBOutlet var msg: UITextField!
    @IBOutlet var datepicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: Any) {
        if #available(iOS 10, *) {
            // UserNotification framework use
            // 알람 동의 여부 확인
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    // 알림 설정
                    DispatchQueue.main.async  { // 백그라운드에서 실행되는 로직을 메인 쓰레드에서 실행되도록 처리해주는 역할
                        // 알림 컨텐츠 정의
                        let nContent = UNMutableNotificationContent()
                        nContent.body = (self.msg.text)!
                        nContent.title = "미리 알림"
                        nContent.sound = UNNotificationSound.default()
                        
                        // 발송 시각을 '지금으로부터 *초 형식'으로 변환
                        let time = self.datepicker.date.timeIntervalSinceNow
                        
                        // 발송 조건
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        
                        // 발송 요청 객체
                        let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                        
                        // notification center
                        UNUserNotificationCenter.current().add(request) { (_) in
                            // 발송 완료 안내 message
                            let date = self.datepicker.date.addingTimeInterval(9*60*60)
                            let message = "알림이 등록되었습니다. 등록된 알림은 \(date)에 발송됩니다"
                            
                            let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                            
                            let ok = UIAlertAction(title: "확인", style: .default)
                            alert.addAction(ok)
                            
                            self.present(alert, animated: false)
                        }
                    }
                } else {
                    let alert = UIAlertController(title: "알림 등록", message: "알림이 허용되어 있지 않습니다.", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    self.present(alert, animated: false)
                    return
                }
            }
        } else {
            // LocalNotification use
        }
    }
    
}

