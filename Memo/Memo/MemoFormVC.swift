//
//  MemoFormVC.swift
//  Memo
//
//  Created by 이민혁 on 2018. 6. 8..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    var subject: String?
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    
    override func viewDidLoad() {
        self.contents.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textViewDidChange(_ textView: UITextView) {
        // textview 내용 최대 15자리까지 읽어 subject 변수에 저장
        let contents = textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length )
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        // navigation title에 표시
        self.navigationItem.title = subject
    }
    
    @IBAction func save(_ sender: Any) {
        // 1. 내용을 입력하지 않았을 경우
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        // 2. MemoData 객체 생성, 데이터 담기.
        let data = MemoData()
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        
        // 3. AppDelegate 객체 읽어온 다음, memolist 배열에 MemoData 객체 추가
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        // 4. 작성폼 화면 종료, 이전 화면으로 돌아가기
        _ = self.navigationController?.popViewController(animated: true)
    }
    // Image Picker
    @IBAction func pick(_ sender: Any) {
        //Create Image Picker Instance
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        // Image Picker present
        self.present(picker, animated: false)
    }
    
    // Select Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Image 미리보기
        self.preview.image = info[UIImagePickerControllerEditedImage] as? UIImage
        // Close Image Pick Controller
        picker.dismiss(animated: false)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
