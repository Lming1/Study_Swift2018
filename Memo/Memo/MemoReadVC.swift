//
//  MemoReadVC.swift
//  Memo
//
//  Created by 이민혁 on 2018. 6. 8..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {
    var param : MemoData?
    
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        // 제목, 내용, 이미지 출력
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        // 날짜 포맷 변환
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (param?.regdate)!)
        
        // navigation title에 날짜 표시
        self.navigationItem.title = dateString
    }

}
