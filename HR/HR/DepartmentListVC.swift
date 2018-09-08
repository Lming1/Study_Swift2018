//
//  DepartmentListVC.swift
//  HR
//
//  Created by 이민혁 on 2018. 8. 21..
//  Copyright © 2018년 이민혁. All rights reserved.
//


import UIKit

class DepartmentListVC: UITableViewController {
    
    var departList: [(departCd: Int, departTitle: String, departAddr: String)]! // Data Source
    let departDAO = DepartmentDAO() // SQLite DAO 객체
    
    override func viewDidLoad() {
        self.departList = self.departDAO.find()
        self.initUI()
    }
    
    // UI 초기화
    func initUI() {
        // navigation title label
        let navTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        navTitle.numberOfLines = 2
        navTitle.textAlignment = .center
        navTitle.font = UIFont.systemFont(ofSize: 14)
        navTitle.text = "부서 목록 \n" + "총 \(self.departList.count) 개"
        
        // navigation bar UI
        self.navigationItem.titleView = navTitle
        self.navigationItem.leftBarButtonItem = self.editButtonItem // 편집 버튼
        
        self.tableView.allowsSelectionDuringEditing = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.departList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = self.departList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DEPART_CELL")
        cell?.textLabel?.text = rowData.departTitle
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell?.detailTextLabel?.text = rowData.departAddr
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        
        return cell!
        
    }
    
    // create
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "신규 부서 등록", message: "신규 부서를 등록해 주세요", preferredStyle: .alert)
        alert.addTextField() { (tf) in tf.placeholder = "부서명" }
        alert.addTextField() { (tf) in tf.placeholder = "주소" }
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default) { (_) in
            // 부서 등록
            let title = alert.textFields?[0].text
            let addr = alert.textFields?[1].text
            
            if self.departDAO.create(title: title!, addr: addr!) {
                // 부서를 등록하면 테이블 갱신
                self.departList = self.departDAO.find()
                self.tableView.reloadData()
                
                // navTitle 갱신
                let navTitle = self.navigationItem.titleView as! UILabel
                navTitle.text = "부서 목록 \n" + "총 \(self.departList.count) 개"
            }
        })
        self.present(alert, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    // 삭제 반영
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 삭제할 행의 departCd 추출
        let departCd = self.departList[indexPath.row].departCd
        
        if departDAO.remove(departCd: departCd) {
            self.departList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // navTitle 갱신
            let navTitle = self.navigationItem.titleView as! UILabel
            navTitle.text = "부서 목록 \n" + "총 \(self.departList.count) 개"
        }
    }
}

