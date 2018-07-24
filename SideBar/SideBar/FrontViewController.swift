//
//  FrontViewController.swift
//  SideBar
//
//  Created by 이민혁 on 2018. 7. 24..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {
    @IBOutlet var sideBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // 메인 컨트롤러의 참조 정보를 가져오기
        if let revealVC = self.revealViewController() {
            // 버튼이 클릭될 때, 메인 컨트롤러에 정의된 revealToggle 호출
            // 일반 버튼이 아님에 따라, addTarget 메소드 사용 불가
            
            self.sideBarButton.target = revealVC
            self.sideBarButton.action = #selector(revealVC.revealToggle(_:))
            
            // 제스처 추가
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
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
