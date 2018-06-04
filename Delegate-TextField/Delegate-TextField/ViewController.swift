//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by 이민혁 on 2018. 5. 29..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var isOk: UISwitch!
    @IBOutlet var tf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // text field 속성 설정
        // 설정해야할 것 : 안내 메세지, 키보드 타입, 키보드 스타일, 리턴키 타입, 리턴키 자동 활성화
        self.tf.placeholder = "값을 입력해주세요."
        self.tf.keyboardType = UIKeyboardType.alphabet
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark
        self.tf.returnKeyType = UIReturnKeyType.join
        self.tf.enablesReturnKeyAutomatically = true
        
        // text field style
        // 설정해야할 것 : 테두리 스타일(직선), 배경 색상(white: 0.87, alpha:1.0), 수직 방향 텍스트 가운데 정렬, 수평방향 텍스트 가운데 정렬, 테두리 색상 회색, 두께 2.0pt
        
        self.tf.borderStyle = UITextBorderStyle.line
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        self.tf.contentVerticalAlignment = .center
        self.tf.contentHorizontalAlignment = .center
        self.tf.layer.borderColor = UIColor.darkGray.cgColor
        self.tf.layer.borderWidth = 2.0
        
        // First Responder
        self.tf.becomeFirstResponder()
        
        // Delegate 지정
        self.tf.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func confirm(_ sender: Any) {
        // Textfield First Responder 해제
        self.tf.resignFirstResponder()
    }
    @IBAction func input(_ sender: Any) {
        // Textfield First Responder 설정
        self.tf.becomeFirstResponder()
    }
    
    //text field 편집을 시작할 때 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("text field 편집 시작됩니다")
        return true
    }
    
    //text field 편집이 시작된 후 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("text field 편집 시작되었습니다")
    }
    
    //text field 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("text field 내용 삭제됩니다.")
        return true
    }
    
    //text field 내용이 변경될 때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("text field 내용이 \(string)으로 변경됩니다.")
        if isOk.isOn == true {
            return true
        } else {
            return false
        }
//        if Int(string) == nil { // 입력된 값이 숫자가 아니라면 true 반환
//            //현재 텍스트 필드에 입력된 길이와 더해질 문자열 길이의 합이 10을 넘는다면 반영 x
//            if (textField.text?.count)! + string.count > 10 {
//                return false
//            } else {
//               return true
//            }
//        } else { // 입력된 값이 숫자라면 false를 반환
//            return false
//        }
    }
    
    //text field return key가 눌렸을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("return key가 눌러졌습니다.")
        return true
    }
    
    //text field 편집이 종료될 때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("text field 편집이 종료됩니다.")
        return true
    }
    
    //text field 편집이 종료되었을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("text field 편집이 종료되었습니다.")
    }
    
    
}

