//
//  MemoData.swift
//  Memo
//
//  Created by 이민혁 on 2018. 6. 8..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit
import CoreData

class MemoData {
    // 식별
    var memoIdx : Int?
    // 제목
    var title : String?
    // 내용
    var contents : String?
    // 이미지
    var image : UIImage?
    // 작성일
    var regdate : Date?
    
    // 원본 MemoMO 객체 참조
    var objectID: NSManagedObjectID?
}
