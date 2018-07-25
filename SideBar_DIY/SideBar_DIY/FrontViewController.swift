//
//  FrontViewController.swift
//  SideBar_DIY
//
//  Created by 이민혁 on 2018. 7. 25..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {
    // 사이드 바 오픈 기능 위임 delegate
    var delegate: RevealViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 사이드 바 오픈용 버튼 정의
        let btnSideBar = UIBarButtonItem(image: UIImage(named: "sidemenu.png"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(moveSide))
        // 버튼을 내비게이션 바의 왼쪽 영역에 추가
        self.navigationItem.leftBarButtonItem = btnSideBar
        
        // 화면 끝 -> 다른 쪽 패닝 제스처 정의
        let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragLeft.edges = UIRectEdge.left // 시작 모서리 : 왼쪽
        self.view.addGestureRecognizer(dragLeft) // 뷰에 제스처 등록하기
        
        // 화면 스와이프 제스처 정의
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragRight.direction = .left // 왼쪽 방향
        self.view.addGestureRecognizer(dragRight)
    }
    
    // 사용자 액션에 반응하여 델리게이트 메소드 호출
    @objc func moveSide(_ sender: Any) {
        NSLog("button test")
//        if self.delegate?.isSideBarShowing == false {
//            self.delegate?.openSideBar(nil) // 사이드 바를 연다
//        } else {
//            self.delegate?.closeSideBar(nil) // 닫는다
//        }
        
        if sender is UIScreenEdgePanGestureRecognizer {
            self.delegate?.openSideBar(nil)
        } else if sender is UISwipeGestureRecognizer {
            self.delegate?.closeSideBar(nil)
        } else if sender is UIBarButtonItem {
            if self.delegate?.isSideBarShowing == false {
                self.delegate?.openSideBar(nil)
            } else {
                self.delegate?.closeSideBar(nil)
            }
        }
    }

    
}
