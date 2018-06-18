//
//  ViewController.swift
//  Custom_Button
//
//  Created by 이민혁 on 2018. 6. 13..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // create button instance
        let btn = UIButton(type: UIButtonType.system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("test button", for: UIControlState.normal)
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        // create button in root view
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func btnClick(_ sender: Any) {
        // 호출한 객체가 버튼이라면
        if let btn = sender as? UIButton {
            btn.setTitle("클릭했네?", for: UIControlState.normal)
        }
    }


}

