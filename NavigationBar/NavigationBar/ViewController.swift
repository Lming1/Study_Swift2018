//
//  ViewController.swift
//  NavigationBar
//
//  Created by 이민혁 on 2018. 7. 15..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.initTitle()
//        self.initTitleNew()
//        self.initTitleImage()
        self.initTitleInput()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTitleInput() {
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = UIColor.white
        tf.font = UIFont.systemFont(ofSize: 13)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .URL
        tf.keyboardAppearance = .dark
        tf.layer.borderWidth = 0.3
        tf.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        self.navigationItem.titleView = tf
        
        
//        let v = UIView()
//        v.frame = CGRect(x: 0, y: 0, width: 150, height: 37)
//        v.backgroundColor = UIColor.brown
//
//        let leftItem = UIBarButtonItem(customView: v)
//        self.navigationItem.leftBarButtonItem = leftItem
//
//        let rv = UIView()
//        rv.frame = CGRect(x: 0, y: 0, width: 100, height: 37)
//        rv.backgroundColor = UIColor.red
//
//        let rightItem = UIBarButtonItem(customView: rv)
//        self.navigationItem.rightBarButtonItem = rightItem
        
        let back = UIImage(named: "arrow-back")
        // 실습용으로 action은 nil..
        let leftItem = UIBarButtonItem(image: back, style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftItem
        
        
        // 오른쪽 bar button item
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        let rightItem = UIBarButtonItem(customView: rv)
        self.navigationItem.rightBarButtonItem = rightItem
        
        // 카운트 값
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        
        // 외곽선 처리
        cnt.layer.cornerRadius = 3
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        rv.addSubview(cnt)
        
        // more button
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named: "more"), for: .normal)
        
        rv.addSubview(more)
        
    }
    
    
    
    func initTitleImage() {
        let image = UIImage(named: "swift_logo")
        let imageV = UIImageView(image: image)
        
        self.navigationItem.titleView = imageV
    }
    
    func initTitleNew() {
        // 뷰 생성(컨테이너 성격...)
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        // 상단 레이블 정의
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = UIColor.white
        topTitle.text = "58개 숙소"
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = UIColor.white
        subTitle.text = "1박(7월 15일 ~ 7월 16일)"
        
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        self.navigationItem.titleView = containerView
        
        let color = UIColor(red: 0.02, green: 0.02, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    
    func initTitle()  {
        let navTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        navTitle.numberOfLines = 2
        navTitle.textAlignment = .center
        navTitle.textColor = UIColor.white
        navTitle.font = UIFont.systemFont(ofSize: 15)
        navTitle.text = "58개 숙소 \n 1박(7월 15일 ~ 7월 16일)"
        self.navigationItem.titleView = navTitle
        
        let color = UIColor(red: 0.02, green: 0.02, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }


}

