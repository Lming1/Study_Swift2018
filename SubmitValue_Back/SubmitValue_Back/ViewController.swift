//
//  ViewController.swift
//  SubmitValue_Back
//
//  Created by 이민혁 on 2018. 5. 24..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
//    var paramEmail: String?
//    var paramUpdate: Bool?
//    var paramInterval: Double?
    
    override func viewWillAppear(_ animated: Bool) {
//        if let email = paramEmail {
//            resultEmail.text = email
//        }
//
//        if let update = paramUpdate {
//            resultUpdate.text = update==true ? "자동갱신":"자동갱신안함"
//        }
//
//        if let interval = paramInterval {
//            resultInterval.text = "\(Int(interval))분마다"
//        }
        // AppDelegate 호출
//        let ad = UIApplication.shared.delegate as? AppDelegate
        
        
        // 값 불러와!
//        if let email = ad?.paramEmail {
//            resultEmail.text = email
//        }
//
//        if let update = ad?.paramUpdate {
//            resultUpdate.text = update==true ? "자동갱신":"자동갱신안함"
//        }
//
//        if let interval = ad?.paramInterval {
//            resultInterval.text = "\(Int(interval))분마다"
//        }
        
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email") {
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분마다"
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

