//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by 이민혁 on 2018. 5. 25..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        // 간혹 메세지창을 처리해야할 때(사용자의 액션 없이도..)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alert(_ sender: Any) {
        // 메세지 창 객체
        let alert = UIAlertController(title: "Select", message: "Contents", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            self.result.text = "취소 버튼 클릭"
        }
        let ok = UIAlertAction(title: "accept", style: .default) { (_) in
            self.result.text = "확인 버튼 클릭"
        }
        let exec = UIAlertAction(title: "run", style: .destructive) { (_) in
            self.result.text = "실행 버튼 클릭"
        }
        let stop = UIAlertAction(title: "stop", style: .default) { (_) in
            self.result.text = "중지 버튼 클릭"
        }
        // 버튼 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        // 메시지 창 실행
        self.present(alert, animated: false)
        
    }
    
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let message = "사용자의 Apple ID hello@test.com의 암호를 입력하십시오"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            //확인 버튼 클릭시 처리할 내용
            if let tf = alert.textFields?.first {
                print("입력된 값은 \( tf.text! )입니다.")
            } else {
                print("입력된 값이 없습니다.")
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // text field add
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: false)
        
    }
    
    @IBAction func auth(_ sender: Any) {
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            // 확인 버튼 클릭시
            let loginId = alert.textFields?[0].text
            let loginPass = alert.textFields?[1].text
            
            if loginId == "test" && loginPass == "test1234" {
                self.result.text = "인증 성공"
            } else {
                self.result.text = "인증 실패"
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 아이디 필드
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "아이디"
            tf.isSecureTextEntry = false
        })
        
        // 패스워드 필드
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        })
        
        
        self.present(alert, animated: false)
        
    }
    
    
    
    
}

