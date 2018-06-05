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
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        
        // call loadRequest method.
        self.wv.load(req)
        
    }
    

}
