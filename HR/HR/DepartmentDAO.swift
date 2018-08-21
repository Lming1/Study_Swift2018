//
//  DepartmentDAO.swift
//  HR
//
//  Created by 이민혁 on 2018. 8. 21..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import Foundation

class DepartmentDAO {
    
    // 튜플 타입 정의
    typealias DepartRecord = (Int, String, String)
    
    // FMDB
    
    // SQLite connect & init
    
    lazy var fmdb : FMDatabase! = {
        // 파일 매니저
        let fileMgr = FileManager.default
        
        // 샌드박스 내 문서 디렉터리에서 데이터베이스 경로 확인
        let docPath = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first
        let dbPath = docPath!.appendingPathComponent("hr.sqlite").path
        
        // 샌드박스 경로에 파일이 없다면, 메인에 만들어둔 hr.sqlite 복사
        if fileMgr.fileExists(atPath: dbPath) == false {
            let dbSource = Bundle.main.path(forResource: "hr", ofType: "sqlite")
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath)
        }
        
        // 데이터베이스 파일을 바탕으로 FMDatabase 객체 생성
        let db = FMDatabase(path: dbPath)
        return db
    }()
}
