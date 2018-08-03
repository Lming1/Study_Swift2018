//
//  Utils.swift
//  Memo
//
//  Created by 이민혁 on 2018. 8. 4..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import Foundation

extension UIViewController {
    var tutorialsSB: UIStoryboard {
        return UIStoryboard(name: "Tutorial", bundle: Bundle.main)
    }
    
    func instanceTutorialVC(name: String) -> UIViewController? {
        return self.tutorialsSB.instantiateViewController(withIdentifier: name)
    }
}
