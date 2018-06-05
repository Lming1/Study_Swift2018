//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by 이민혁 on 2018. 6. 6..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet var wv: WKWebView! // Deploy target 신경쓰기..10.0 안되네
    
    var mvo: MovieVO! // 목록 화면에서 전달하는 영화 정보를 받을 변수..
    
    override func viewDidLoad() {
        NSLog("linkurl = \(self.mvo.detail!), title =\(self.mvo.title!)")
        
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        // create URLRequest instance
        if let url = self.mvo.detail {
            if let urlObj = URL(string: url) {
                let req = URLRequest(url: urlObj)
                // call loadRequest method.
                 self.wv.load(req)
            } else { // URL 형식 오류에 대한 예외처리
                let alert = UIAlertController(title: "오류", message: "잘못된 URL", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                    // 이전 페이지로 돌려보내기
                        _ = self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(cancelAction)
                self.present(alert, animated: false, completion: nil)
            }
        } else {
            // URL 값이 전달되지 않았을 경우.
            let alert = UIAlertController(title: "오류", message: "필수 파라미터 누락", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                    _ = self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(cancelAction)
            self.present(alert, animated: false, completion: nil)
        }
        
        
        
    }
    

}
