//
//  CSLogButton.swift
//  Memo
//
//  Created by 이민혁 on 2018. 7. 22..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit


public enum CSLogType: Int {
    case basic // 기본 로그
    case title // 버튼 타이틀
    case tag // 버튼 태그 값
}

public class CSLogButton: UIButton {
    
    public var logType: CSLogType = .basic

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // button style
        self.setBackgroundImage(UIImage(named: "button-bg"), for: .normal)
        self.tintColor = UIColor.white
        
        // button click event
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
    }
    
    @objc func logging(_ sender: UIButton) {
        switch self.logType {
        case .basic: // 단순 로그 출력
            NSLog("button click")
        case .title: // 로그에 버튼의 타이틀 출력
            let btnTitle = sender.titleLabel?.text ?? "타이틀 없는"
            NSLog("\(btnTitle) button click")
        case .tag: // 로그에 버튼의 태그 출력
            NSLog("\(sender.tag) button click")
        }
    }

}
