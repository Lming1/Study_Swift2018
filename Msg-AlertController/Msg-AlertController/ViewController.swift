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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alert(_ sender: Any) {
        // 메세지 창 객체
        let alert = UIAlertController(title: "Select", message: "Contents", preferredStyle: .alert)
        let cancle = UIAlertAction(title: "cancle", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "accept", style: .default, handler: nil)
        let exec = UIAlertAction(title: "run", style: .destructive)
        let stop = UIAlertAction(title: "stop", style: .default, handler: nil)
        // 버튼 컨트롤러에 등록
        alert.addAction(cancle)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        // 메시지 창 실행
        self.present(alert, animated: false)
        
    }
    
}

