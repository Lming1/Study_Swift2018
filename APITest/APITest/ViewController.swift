//
//  ViewController.swift
//  APITest
//
//  Created by 이민혁 on 16/10/2018.
//  Copyright © 2018 이민혁. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet var currentTime: UILabel!
    @IBOutlet var userId: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var responseView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func callCurrentTime(_ sender: Any) {
        do {
            let url = URL(string: "http://")
            let response = try String(contentsOf: url!)
            self.currentTime.text = response
            self.currentTime.sizeToFit()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    @IBAction func post(_ sender: Any) {
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = "userId=\(userId)&name=\(name)"
        
        let paramData = param.data(using: .utf8)
        
        let url = URL(string: "http://")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        // URLSession 객체를 통해 전송 및 응답값 처리
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 응답 에러
            if let e = error {
                NSLog("An error has occurred : \(e.localizedDescription)")
                return
            }
            // 응답 처리
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    let result = jsonObject["result"] as? String
                    let timeStamp = jsonObject["timestamp"] as? String
                    let userId = jsonObject["userId"] as? String
                    let name = jsonObject["name"] as? String
                    
                    if result == "SUCCESS" {
                        self.responseView.text = "ID : \(userId!)" + "\n" + "이름 : \(name!)" + "\n" + "응답결과 : \(result!)" + "\n" + "응답시간 : \(timeStamp!)" + "\n" + "요청방식 : x-www-form-urlencoded"
                    }
                } catch let e as NSError {
                    print("An error has occurred while parsing JSONObject : \(e.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    
    
    @IBAction func json(_ sender: Any) {
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        
        let param = ["userId" : userId, "name" : name]
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        let url = URL(string: "http://")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let e = error {
                NSLog("An error has occurred : \(e.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    
                    guard let jsonObject = object else { return }
                    
                    let result = jsonObject["result"] as? String
                    let timeStamp = jsonObject["timestamp"] as? String
                    let userId = jsonObject["userId"] as? String
                    let name = jsonObject["name"] as? String
                    if result == "SUCCESS" {
                        self.responseView.text = "ID : \(userId!)" + "\n" + "이름 : \(name!)" + "\n" + "응답결과 : \(result!)" + "\n" + "응답시간 : \(timeStamp!)" + "\n" + "요청방식 : application/json"
                    }
                } catch let e as NSError {
                    print("An error has occurred while parsing JSONObject : \(e.localizedDescription)")
                }
            }
            
        }
        task.resume()
    }
    

}

