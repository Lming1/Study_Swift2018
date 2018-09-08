//
//  EmployeeListVC.swift
//  HR
//
//  Created by 이민혁 on 2018. 8. 21..
//  Copyright © 2018년 이민혁. All rights reserved.
//


import UIKit

class EmployeeListVC: UITableViewController {
    // Data Source
    var empList: [EmployeeVO]!
    
    // SQLite
    var empDAO = EmployeeDAO()
    
    override func viewDidLoad() {
        self.empList = self.empDAO.find()
        self.initUI()
    }
    
    // UI 초기화
    func initUI() {
        // navigation title label config
        
        let navTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        navTitle.numberOfLines = 2
        navTitle.textAlignment = .center
        navTitle.font = UIFont.systemFont(ofSize: 14)
        navTitle.text = "사원 목록 \n" + "총 \(self.empList.count) 명"
        
        self.navigationItem.titleView = navTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.empList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = self.empList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EMP_CELL")
        
        // 사원명 + 재직상태
        cell?.textLabel?.text = rowData.empName + "(\(rowData.stateCd.desc()))"
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        cell?.detailTextLabel?.text = rowData.departTitle
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        
        return cell!
    }
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "사원 등록", message: "등록할 사원 정보를 입력해 주세요", preferredStyle: .alert)
        alert.addTextField() { (tf) in tf.placeholder = "사원명" }
        // contentViewController
        let pickervc = DepartPickerVC()
        alert.setValue(pickervc, forKey: "contentViewController")
        
        // 등록창 버튼 처리
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default) {(_) in
            // 사원 등록 처리 로직
            // 알림창의 입력 필드에서 값을 읽어온다.
            var param = EmployeeVO()
            param.departCd = pickervc.selectedDepartCd
            param.empName = (alert.textFields?[0].text)!
            // 가입일은 오늘로 지정
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            param.joinDate = df.string(from: Date())
            // 재직 상태는 '재직중'
            param.stateCd = EmpStateType.ING
            // DB 처리
            if self.empDAO.create(param: param) {
                // 성공이면 테이블 뷰 갱신
                self.empList = self.empDAO.find()
                self.tableView.reloadData()
                // 네비게이션 타이틀 갱신
                if let navTitle = self.navigationItem.titleView as? UILabel {
                    navTitle.text = "사원 목록 \n" + "총 \(self.empList.count) 명"
                }
            }
        })
        self.present(alert, animated: false)
    }
    
    
}
