//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by 이민혁 on 2018. 5. 23..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail:String = ""
    var paramUpdate: Bool = false
    var paramInterVal:Double = 0
    
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterVal))분 마다 갱신"
    }
    
    
    @IBAction func onBack(_ sender: Any) {
//        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    
}
