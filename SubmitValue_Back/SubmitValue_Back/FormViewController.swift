//
//  FormViewController.swift
//  SubmitValue_Back
//
//  Created by 이민혁 on 2018. 5. 25..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
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
        self.intervalText.text = "\(value)분마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        // 이전 화면 객체를 읽어온 다음 ViewController 타입으로 캐스팅
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ViewController else {
//            return
//        }
        
        // 값을 전달한다
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
        // 이전 화면으로 복귀한다...
        
//        self.presentingViewController?.dismiss(animated: true)
        
        
        // AppDelegate 객체 인스턴스 호출
        let ad = UIApplication.shared.delegate as? AppDelegate

        // 값 저장
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value
        
        // 이전 화면 복귀
        
        self.presentingViewController?.dismiss(animated: true)
    }
}
