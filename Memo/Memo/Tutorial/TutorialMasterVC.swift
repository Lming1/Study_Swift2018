//
//  TutorialMasterVC.swift
//  Memo
//
//  Created by 이민혁 on 2018. 8. 4..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import Foundation
import UIKit

class TutorialMasterVC: UIViewController, UIPageViewControllerDataSource {
    var pageVC: UIPageViewController!
    
    // 컨텐츠 뷰 컨트롤러에 들어갈 타이틀, 이미지
    var contentTitles = ["STEP 1", "STEP 2", "STEP 3", "STEP 4"]
    var contentImages = ["Page0", "Page1", "Page2", "Page3"]
    
    override func viewDidLoad() {
        // 페이지 뷰 컨트롤러 객체 생성
        self.pageVC = self.instanceTutorialVC(name: "PageVC") as! UIPageViewController
        self.pageVC.dataSource = self
        // 페이지 뷰 컨트롤러 기본 페이지 지정
        let startContentVC = self.getContentVC(atIndex: 0)!
        self.pageVC.setViewControllers([startContentVC], direction: .forward, animated: true)
        // 페이지 뷰 컨트롤러의 출력 영역 지정
        self.pageVC.view.frame.origin = CGPoint(x: 0, y: 0)
        self.pageVC.view.frame.size.width = self.view.frame.width
        self.pageVC.view.frame.size.height = self.view.frame.height - 50
        
        // 페이지 뷰 컨트롤러를 마스터 뷰 컨트롤러의 자식 뷰 컨트롤러로 설정
        self.addChildViewController(self.pageVC)
        self.view.addSubview(self.pageVC.view)
        self.pageVC.didMove(toParentViewController: self)
    }
    
    
    func getContentVC(atIndex idx: Int) -> UIViewController? {
        guard self.contentTitles.count >= idx && self.contentTitles.count > 0 else {
            return nil
        }
        
        guard let cvc = self.instanceTutorialVC(name: "ContentsVC") as? TutorialContentsVC else {
            return nil
        }
        
        cvc.titleText = self.contentTitles[idx]
        cvc.imageFile = self.contentImages[idx]
        cvc.pageIndex = idx
        return cvc
    }
    
    // 현재의 컨텐츠 뷰 컨트롤러보다 앞쪽에 올 컨텐츠 뷰 컨트롤러 객체
    // 현재의 상태에서 앞쪽으로 스와이프 했을 때, 보여줄 객체를 의미
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // 현재 페이지 인덱스
        guard var index = (viewController as! TutorialContentsVC).pageIndex else {
            return nil
        }
        
        // 현재 인덱스가 맨 앞이면 nil
        guard index > 0 else {
            return nil
        }
        
        // 현재 인덱스에서 하나 뺌
        index -= 1
        return self.getContentVC(atIndex: index)
    }
    
    // 현재의 컨텐츠 뷰 컨트롤러보다 뒤쪽에 올 컨텐츠 뷰 컨트롤러 객체
    // 현재의 상태에서 뒤쪽으로 스와이프 했을 때, 보여줄 객체를 의미
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // 현재 페이지 인덱스
        guard var index = (viewController as! TutorialContentsVC).pageIndex else {
            return nil
        }
        index += 1 // 현재 인덱스에 하나를 더함
        // 인덱스는 항상 배열 데이터의 크기보다 작아야 함
        guard index < self.contentTitles.count else {
            return nil
        }
        
        return self.getContentVC(atIndex: index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.contentTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
