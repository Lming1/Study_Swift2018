//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by 이민혁 on 2018. 5. 22..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
