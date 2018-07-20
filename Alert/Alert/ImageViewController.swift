//
//  ImageViewController.swift
//  Alert
//
//  Created by 이민혁 on 2018. 7. 20..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        // 이미지, 이미지 뷰 객체 생성
        let icon = UIImage(named: "rating5")
        let iconV = UIImageView(image: icon)
        
        // 이미지 뷰의 영역과 위치 지정
        iconV.frame = CGRect(x: 0, y: 0, width: (icon?.size.width)!, height: (icon?.size.height)!)
        // 루트 뷰에 이미지 뷰 추가
        self.view.addSubview(iconV)
        // 외부에서 참조할 뷰 컨트롤러 사이즈를 이미지 크기와 동일하게 설정
        self.preferredContentSize = CGSize(width: (icon?.size.width)!, height: (icon?.size.height)! + 10)
        
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
