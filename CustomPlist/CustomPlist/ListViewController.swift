//
//  ListViewController.swift
//  CustomPlist
//
//  Created by 이민혁 on 2018. 7. 28..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var account: UITextField!
    
    var accountList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let picker = UIPickerView()
        picker.delegate = self
        self.account.inputView = picker
        
        // 툴 바
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: 0, height: 35)
        toolBar.barTintColor = UIColor.lightGray
        // 액세서리 뷰 영역에 툴 바 표시
        self.account.inputAccessoryView = toolBar
        
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(pickerDone)
        
        // 가변 폭 버튼 정의
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // 신규 계정 등록
        let new = UIBarButtonItem()
        new.title = "New"
        new.target = self
        new.action = #selector(newAccount(_:))
        
        toolBar.setItems([new, flexSpace, done], animated: true)
    }
    
    @objc func pickerDone(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func newAccount(_ sender: Any) {
        self.view.endEditing(true)
        
        let alert = UIAlertController(title: "새 계정을 입력해주세요", message: nil, preferredStyle: .alert)
        
        alert.addTextField() {
            $0.placeholder = "ex) abc.gmail.com"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default){ (_) in
            if let account = alert.textFields?[0].text {
                self.accountList.append(account)
                self.account.text = account
            }
        })
        self.present(alert, animated: false, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.accountList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.accountList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let account = self.accountList[row]
        self.account.text = account
        
//        self.view.endEditing(true)
    }

  
}
