//
//  ViewController.swift
//  Alert
//
//  Created by 이민혁 on 2018. 7. 16..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 기본 알림창 버튼
        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertBtn.center.x = self.view.frame.width / 2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        self.view.addSubview(defaultAlertBtn)
    }
    
    @objc func defaultAlert(_ sender: Any) {
        // 알림창 정의
        let alert = UIAlertController(title: nil, message: "메세지", preferredStyle: .alert)
        // 버튼 정의
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        // 버튼 -> 알림창 추가
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        // 알림창에 들어갈 뷰 컨트롤러
        let v = UIViewController()
        v.view.backgroundColor = UIColor.blue // 컨텐츠뷰 영역 확인을 위한 색상 지정
        // 알림창에 뷰 컨트롤러 등록
        alert.setValue(v, forKey: "contentViewController")
        // 알림창 화면 표시
        self.present(alert, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

