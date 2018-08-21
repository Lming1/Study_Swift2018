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
    
    init() {
        self.fmdb.open()
    }
    deinit {
        self.fmdb.close()
    }
    
    func find() -> [DepartRecord] {
        // 반환할 데이터를 담을 [DepartRecord] 타입의 객체 정의
        var departList = [DepartRecord]()
        
        do {
            // 부서 목록 sql
            let sql = """
             SELECT depart_cd, depart_title, depart_addr FROM department ORDER BY depart_cd ASC
            """
            
            let rs = try self.fmdb.executeQuery(sql, values: nil)
            
            // 결과 추출
            while rs.next() {
                let departCd = rs.int(forColumn: "depart_cd")
                let departTitle = rs.string(forColumn: "depart_title")
                let departAddr = rs.string(forColumn: "depart_addr")
                
                departList.append((Int(departCd), departTitle!, departAddr!))
            }
        } catch let error as NSError  {
            print("failed: \(error.localizedDescription)")
        }
        return departList
    }
    
    func get(departCd: Int) -> DepartRecord? {
        // 질의
        let sql = """
            SELECT depart_cd, depart_title, depart_addr FROM department WHERE depart_cd = ?
        """
        
        let rs = self.fmdb.executeQuery(sql, withArgumentsIn: [departCd])
        
        // 결과 추출
        if let _rs = rs { // 결과 => 옵셔널 타입으로 반환됨, 일반 상수에 바인딩하여 해제해야함
            _rs.next()
            
            let departId = _rs.int(forColumn: "depart_cd")
            let departTitle = _rs.string(forColumn: "depart_title")
            let departAddr = _rs.string(forColumn: "depart_addr")
            
            return (Int(departId), departTitle!, departAddr!)
        } else {
            return nil
        }
    }
    
    func create(title: String!, addr: String!) -> Bool {
        guard title != nil && title?.isEmpty == false else {
            return false
        }
        guard addr != nil && addr?.isEmpty == false else {
            return false
        }
        
        do {
            let sql = """
                INSERT INTO department(depart_title, depart_addr)
                VALUES (?, ?)
                """
            try self.fmdb.executeUpdate(sql, values: [title, addr])
            return true
        } catch let error as NSError {
            print("Insert Error : \(error.localizedDescription)")
            return false
        }
    }
    
    func remove(departCd: Int) -> Bool {
        do {
            let sql = "DELETE FROM department WHERE depart_cd= ? "
            try self.fmdb.executeUpdate(sql, values: [departCd])
            return true
        } catch let error as NSError {
            print("DELETE Error : \(error.localizedDescription)")
            return false
        }
    }
}
