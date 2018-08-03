//
//  TutorialContentsVC.swift
//  Memo
//
//  Created by 이민혁 on 2018. 8. 4..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import Foundation
import UIKit

class TutorialContentsVC: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bgImageView: UIImageView!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        self.titleLabel.text = self.titleText
        self.titleLabel.sizeToFit()
        
        self.bgImageView.image = UIImage(named: self.imageFile)
    }
}
