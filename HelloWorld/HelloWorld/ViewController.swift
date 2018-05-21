//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이민혁 on 2018. 5. 21..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello? Swift"
    }
    
}

