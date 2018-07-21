//
//  ControlViewController.swift
//  Alert
//
//  Created by 이민혁 on 2018. 7. 20..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    private let slider = UISlider()
    var sliderValue: Float {
        return self.slider.value
    }
    override func viewDidLoad() {
        self.slider.minimumValue = 0
        self.slider.maximumValue = 100
        
        self.slider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        self.view.addSubview(self.slider)
        self.preferredContentSize = CGSize(width: self.slider.frame.width, height: self.slider.frame.height + 10)
    }



}
