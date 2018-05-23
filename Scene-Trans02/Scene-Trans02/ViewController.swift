//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by 이민혁 on 2018. 5. 22..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moveByNavi(_ sender: Any) {
        
        // 두번째 뷰 컨트롤러 인스턴스 가져오기
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        // 화면 전환
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    @IBAction func movePresent(_ sender: Any) {
        // 두번째 뷰 컨트롤러 인스턴스 가져오기
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        // 화면 전환
        self.present(uvc, animated: true)
    }
}

