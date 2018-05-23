//
//  ViewController.swift
//  Scene-CustomSegue
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="custom_segue") {
            NSLog("custom segue가 실행됩니다.")
        } else if (segue.identifier=="action_segue") {
            NSLog("action segue가 실행됩니다.")
        } else {
            NSLog("정의되지 않은 segue입니다.")
        }
        
    }
}

