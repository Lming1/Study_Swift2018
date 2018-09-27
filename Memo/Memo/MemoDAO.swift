//
//  MemoDAO.swift
//  Memo
//
//  Created by 이민혁 on 2018. 9. 26..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MemoDAO {
    
    lazy var context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    func fetch(keyword text: String? = nil) -> [MemoData] {
        var memoList = [MemoData]()
        
        // 요청 객체 생성
        let fetchRequest: NSFetchRequest<MemoMO> = MemoMO.fetchRequest()
        // 최신 글 순으로 정렬
        let regdateDesc = NSSortDescriptor(key: "regdate", ascending: false)
        fetchRequest.sortDescriptors = [regdateDesc]
        
        // 검색 키워드가 있을 경우
        if let t = text, t.isEmpty == false {
            fetchRequest.predicate = NSPredicate(format: "contents CONTAINS[c] %@", t)
        }
        
        do {
            let resultset = try self.context.fetch(fetchRequest)
            
            // 읽어온 값을 [MemoData] 타입으로 변환
            for record in resultset {
                let data = MemoData()
                data.title = record.title
                data.contents = record.contents
                data.regdate = record.regdate! as Date
                data.objectID = record.objectID
                
                // 이미지가 있는 경우만 ..
                if let image = record.image as Data? {
                    data.image = UIImage(data: image)
                }
                memoList.append(data)
            }
        } catch let error as NSError {
            NSLog("An error has occurred : %s", error.localizedDescription)
        }
        return memoList
    }
    
    // 새 메모 생성
    func insert(_ data: MemoData) {
        // 관리 객체 인스턴스
        let object = NSEntityDescription.insertNewObject(forEntityName: "Memo", into: self.context) as! MemoMO
        
        // MemoData 값 복사
        object.title = data.title
        object.contents = data.contents
        object.regdate = data.regdate!
        
        if let image = data.image {
            object.image = UIImagePNGRepresentation(image)!
        }
        
        // 변경사항 저장
        do {
            try self.context.save()
        } catch let error as NSError {
            NSLog("An error has occurred : %s", error.localizedDescription)
        }
    }
    
    // 메모 삭제
    func delete(_ objectID: NSManagedObjectID) -> Bool {
        // 삭제할 객체를 찾고, 컨텍스트에서 삭제
        let object = self.context.object(with: objectID)
        self.context.delete(object)
        
        // 변경사항 저장
        do {
            try self.context.save()
            return true
        } catch let error as NSError {
            NSLog("An error has occurred : %s", error.localizedDescription)
            return false
        }
    }
}
