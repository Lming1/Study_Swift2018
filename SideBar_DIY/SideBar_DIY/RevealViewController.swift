//
//  RevealViewController.swift
//  SideBar_DIY
//
//  Created by 이민혁 on 2018. 7. 25..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class RevealViewController: UIViewController {
    var contentVC: UIViewController?
    var sideVC: UIViewController?
    
    var isSideBarSHowing = false
    
    let SLIDE_TIME = 0.3
    let SIDEBAR_WIDTH: CGFloat = 260
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setupView()
    }
    
    // 초기 화면 설정
    func setupView() {
        // front controller 객체 읽어오기
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController {
            // 읽어온 컨트롤러를 contentVC 속성에 저장
            self.contentVC = vc
            // 프론트 컨트롤러 객체를 메인 컨트롤러 자식으로 등록
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
        }
    }
    
    
    // 사이드 바의 뷰를 읽어오기
    func getSideView() {
        if self.sideVC == nil {
            // 사이드 바 컨트롤러 객체 읽어오기
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear") {
                // sideVC 속성에 저장
                self.sideVC = vc
                self.addChildViewController(vc)
                self.view.addSubview(vc.view)
                vc.didMove(toParentViewController: self)
                // 프론트 컨트롤러의 뷰를 제일 위로 올린다
                self.view.bringSubview(toFront: (self.contentVC?.view)!)
            }
        }
    }
    
    // 콘텐츠 뷰에 그림자 효과
    func setShadowEffect(shadow: Bool, offset: CGFloat) {
        if (shadow == true) {
            self.contentVC?.view.layer.cornerRadius = 10
            self.contentVC?.view.layer.shadowOpacity = 0.8 // 투명도
            self.contentVC?.view.layer.shadowColor = UIColor.black.cgColor
            self.contentVC?.view.layer.shadowOffset = CGSize(width: offset, height: offset) // 그림자 크기
        } else {
            self.contentVC?.view.layer.cornerRadius = 0.0
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    // 사이드 바를 연다
    func openSideBar(_ complete: ( () -> Void)? ) {
        self.getSideView()
        self.setShadowEffect(shadow: true, offset: -2)
        // 애니메이션 옵션
        // 애니메이션 실행
        
        
    }
    
    // 사이드 바를 닫는다
    func clodeSideBar(_ complete: ( () -> Void)? ) {
        
    }

   

}
