//
//  CSTabBarController.swift
//  CSTabBar
//
//  Created by 이민혁 on 2018. 7. 21..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class CSTabBarController: UITabBarController {

    
    let csView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
    
    override func viewDidLoad() {
        // 기존 탭 바 숨김 처리
        self.tabBar.isHidden = true
        
        // 새로운 탭 바 역할을 할 뷰를 위해 기준 좌표, 크기 정의
        let width = self.view.frame.width
        let height: CGFloat = 50
        let x: CGFloat = 0
        let y = self.view.frame.height - height
        
        // 새로운 뷰 속성 설정
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = UIColor.darkGray
        self.view.addSubview(self.csView)

        
        // 탭바 버튼 너비 높이 설정
        let tabBtnWidth = self.csView.frame.size.width / 3
        let tabBtnHeight = self.csView.frame.height
        // 버튼 영역 설정
        self.tabItem01.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem02.frame = CGRect(x: tabBtnWidth, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem03.frame = CGRect(x: tabBtnWidth * 2, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        // 버튼 공통 속성 설정. 뷰에 추가
        self.addTabBarBtn(btn: self.tabItem01, title: "첫 번째 버튼", tag: 0)
        self.addTabBarBtn(btn: self.tabItem02, title: "두 번째 버튼", tag: 1)
        self.addTabBarBtn(btn: self.tabItem03, title: "세 번째 버튼", tag: 2)
        
        self.onTabBarItemClick(self.tabItem01)
    }
    
    // 버튼의 공통 속성
    func addTabBarBtn(btn: UIButton, title:String, tag: Int) {
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.yellow, for: .selected)
        
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        self.csView.addSubview(btn)
    }
    
    @objc func onTabBarItemClick(_ sender: UIButton) {
        self.tabItem01.isSelected = false
        self.tabItem02.isSelected = false
        self.tabItem03.isSelected = false
        
        sender.isSelected = true
        
        // 화면 전환
        
        self.selectedIndex = sender.tag
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
