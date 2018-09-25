//
//  LogVC.swift
//  Study_CoreData
//
//  Created by 이민혁 on 2018. 9. 25..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import Foundation
import UIKit

class LogVC: UITableViewController {
    
}

public enum LogType: Int16 {
    case create = 0
    case edit = 1
    case delete = 2
}

extension Int16 {
    func toLogType() -> String {
        switch self {
        case 0:
            return "생성"
        case 1:
            return "수정"
        case 2:
            return "삭제"
        default:
            return ""
        }
    }
}
