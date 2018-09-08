//
//  EmployeeDAO.swift
//  HR
//
//  Created by 이민혁 on 2018. 8. 22..
//  Copyright © 2018년 이민혁. All rights reserved.
//

enum EmpStateType: Int {
    case ING = 0, STOP, OUT // 재직중 0, 휴직 1, 퇴사 2
    
    // 재직 상태 문자열로 변환
    func desc() -> String {
        switch self {
        case .ING:
            return "재직중"
        case .STOP:
            return "휴직"
        case .OUT:
            return "퇴사"
        }
    }
}

struct EmployeeVO {
    var empCd = 0 // 사원코드
    var empName = "" // 사원명
    var joinDate = "" // 입사일
    var stateCd = EmpStateType.ING
    var departCd = 0 // 소속 부서 코드
    var departTitle = "" // 소속 부서명
}

class EmployeeDAO {
    lazy var fmdb: FMDatabase! = {
        // Department와 구조 동일. 리팩토링 필요!!!
       let fileMgr = FileManager.default
        
        let docPath = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first
        let dbPath = docPath!.appendingPathComponent("hr.sqlite").path
        
        if fileMgr.fileExists(atPath: dbPath) == false {
            let dbSource = Bundle.main.path(forResource: "hr", ofType: "sqlite")
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath)
        }
        let db = FMDatabase(path: dbPath)
        return db
    }()
    
    init() {
        self.fmdb.open()
    }
    deinit {
        self.fmdb.close()
    }
    
    // 전체 리스트
    func find(departCd: Int = 0) -> [EmployeeVO] {
        var employeeList = [EmployeeVO]()
        
        do {
            // 조건절 정의
            let condition = departCd == 0 ? "" : "WHERE Employee.depart_cd = \(departCd)"
            let sql = """
                SELECT emp_cd, emp_name, join_date, state_cd, department.depart_title
                FROM employee
                JOIN department On department.depart_cd = employee.depart_cd
                \(condition)
                ORDER BY employee.depart_cd ASC
                """
            
            let rs = try self.fmdb.executeQuery(sql, values: nil)
            
            while rs.next() {
                var record = EmployeeVO()
                
                record.empCd = Int(rs.int(forColumn: "emp_cd"))
                record.empName = rs.string(forColumn: "emp_name")!
                record.joinDate = rs.string(forColumn: "join_date")!
                record.departTitle = rs.string(forColumn: "depart_title")!
                
                let cd = Int(rs.int(forColumn: "state_cd")) // DB에서 읽어온 state_cd
                record.stateCd = EmpStateType(rawValue: cd)!
                
                employeeList.append(record)
            }
        } catch let error as NSError {
            print("failed: \(error.localizedDescription)")
        }
        return employeeList
    }
    
    // 단일 레코드
    func get(empCd: Int) -> EmployeeVO? {
        // 질의
        let sql = """
            SELECT emp_cd, emp_name, join_date, state_cd, department.depart_title
            FROM employee
            JOIN department On department.depart_cd = employee.depart_cd
            WHERE emp_cd = ?
            """
        
        let rs = self.fmdb.executeQuery(sql, withArgumentsIn: [empCd])
        // 결과 처리
        
        if let _rs = rs {
            _rs.next()
            
            var record = EmployeeVO()
            record.empCd = Int(_rs.int(forColumn: "emp_cd"))
            record.empName = _rs.string(forColumn: "emp_name")!
            record.joinDate = _rs.string(forColumn: "join_date")!
            record.departTitle = _rs.string(forColumn: "depart_title")!
            
            let cd = Int(_rs.int(forColumn: "state_cd"))
            record.stateCd = EmpStateType(rawValue: cd)!
            
            return record
        } else  {
            return nil
        }
        
    }
    
    // create
    func create(param: EmployeeVO) -> Bool {
        do {
            let sql = """
                INSERT INTO employee (emp_name, join_date, state_cd, depart_cd)
                VALUES( ?, ?, ?, ? )
                """
            
            // Prepared Statement를 위한 인자값 정의
            var params = [Any]()
            params.append(param.empName)
            params.append(param.joinDate)
            params.append(param.stateCd.rawValue)
            params.append(param.departCd)
            
            try self.fmdb.executeUpdate(sql, values: params)
            return true
        } catch let error as NSError {
            print("Insert ERROR : \(error.localizedDescription)")
            return false
        }
    }
    
    func remove(empCd: Int) -> Bool {
        do {
            let sql = "DELETE FROM employee WHERE emp_cd = ? "
            try self.fmdb.executeUpdate(sql, values: [empCd])
            return true
        } catch let error as NSError {
            print("DELETE Error : \(error.localizedDescription)")
            return false
        }
    }
    
    
    
}
