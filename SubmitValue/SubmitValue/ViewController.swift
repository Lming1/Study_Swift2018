//
//  ViewController.swift
//  SubmitValue
//
//  Created by 이민혁 on 2018. 5. 23..
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

    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var interval: UIStepper!
    
    @IBOutlet var isUpdateText: UILabel!
    
    @IBOutlet var intervalText: UILabel!
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
    
//    @IBAction func onSubmit(_ sender: Any) {
//        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
//                return
//        }
//
//        rvc.paramEmail = self.email.text!
//        rvc.paramUpdate = self.isUpdate.isOn
//        rvc.paramInterVal = self.interval.value
//
////        self.present(rvc, animated: true)
//        self.navigationController?.pushViewController(rvc, animated: true)
//    }
    
    
    @IBAction func onPerformSegue(_ sender: Any) {
        
        self.performSegue(withIdentifier: "MaunalSubmit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else {
            return
        }
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterVal = self.interval.value
        
    }
    
    
}

