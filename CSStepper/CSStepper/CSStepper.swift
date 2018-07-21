//
//  CSStepper.swift
//  CSStepper
//
//  Created by 이민혁 on 2018. 7. 21..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

// 미리보기 지원 어노테이션
@IBDesignable
public class CSStepper: UIView {
    
    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerLabel = UILabel()
    @IBInspectable
    public var value: Int = 0 {
        didSet { // 프로퍼티 값 변경 시 자동 호출
            self.centerLabel.text = String(value)
        }
    }
    
    // 왼쪽 타이틀
    @IBInspectable
    public var leftTitle: String = "⬇︎" {
        didSet {
            self.leftBtn.setTitle(leftTitle, for: .normal)
        }
    }
    
    // 오른쪽 타이틀
    @IBInspectable
    public var rightTitle: String = "⬆︎" {
        didSet {
            self.rightBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    // label 컬러
    @IBInspectable
    public var bgColor: UIColor = UIColor.cyan {
        didSet {
            self.centerLabel.backgroundColor = backgroundColor
        }
    }
    
    // 증감값 단위
    @IBInspectable
    public var stepValue: Int = 1
    // 최대, 최소 값
    @IBInspectable public var maximumValue: Int = 100
    @IBInspectable public var minimumValue: Int = -100
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // Use storyboard
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // Use code?
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    // config stepper
    private func setup() {
        
        let borderWidth: CGFloat = 0.5
        let borderColor = UIColor.blue.cgColor
        
        
        self.leftBtn.tag = -1
        self.leftBtn.setTitle(self.leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = borderColor
        
        self.rightBtn.tag = 1
        self.rightBtn.setTitle(self.rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        
        self.centerLabel.text = String(value)
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = self.bgColor
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = borderColor
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLabel)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let btnWidth = self.frame.height
        let lblWidth = self.frame.width - (btnWidth * 2)
        
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.centerLabel.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
        self.rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: 0, width: btnWidth, height: btnWidth)
        
        self.leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
    }
    
    // value 속성 값 변경
    @objc public func valueChange(_ sender: UIButton) {
        // 값 체크. 최대값 & 최소값 범위를 벗어날 경우 종료
        let sum = self.value + (sender.tag * self.stepValue)
        if sum > self.maximumValue {
            return
        }
        if sum < self.minimumValue {
            return
        }
        
        
        self.value += (sender.tag * self.stepValue)
    }

}
