//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 이민혁 on 2018. 5. 30..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        // 이미지 소스 = 사진 라이브러리 선택
        picker.sourceType = .photoLibrary
        // 이미지 편집기능
        picker.allowsEditing = true
        
        // delegate
        picker.delegate = self
        
        // 이미지 피커 컨트롤러 실행
        self.present(picker, animated: false)
    }
    // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때.
    
    
}

// MARK:- 이미지 피커 컨트롤러 델리게이트 메소드
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false)
        self.dismiss(animated: false){ () in
            // 알림창(진행 안됨..)
            let alert = UIAlertController(title: "", message: "cancel", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            alert.present(alert, animated: false)
            print("alert 실행")
        }
    }
    // 이미지 피커에서 이미지를 선택했을 때
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false) { () in
            // 이미지를 이미지 뷰에 표시하기.
            let img = info[UIImagePickerControllerEditedImage] as? UIImage
            self.imageView.image = img
        }
    }
}

// MARK:- 내비게이션 컨트롤러 델리게이트 메소드
extension ViewController: UINavigationControllerDelegate {
    
}

// MARK:- 텍스트필드 델리게이트 메소드
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

