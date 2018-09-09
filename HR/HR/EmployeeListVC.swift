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
    
    // refresh
    var loadingImg: UIImageView!
    
    // refresh 임계점
    var bgCircle: UIView!
    
    override func viewDidLoad() {
        self.empList = self.empDAO.find()
        self.initUI()
        
        //Pull To Refresh
        self.refreshControl = UIRefreshControl()
//        self.refreshControl?.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
        self.refreshControl?.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
        
        // loading img init & 정렬 , 새로고침 컨트롤 영역의 높이에 맞추어 항상 로딩 이미지가 수직 중앙에 위치하려면, 영역의 높이가 달라지는 순간마다
        // 로딩 이미지의 y좌표 위치가 교정되어야함.. 이를 해결하기 위해서는 스크롤이 발생될때마다 호출되는 scrollViewDidScroll 메소드의 도움을 받아야함
        self.loadingImg = UIImageView(image: UIImage(named: "refresh"))
        self.loadingImg.center.x = (self.refreshControl?.frame.width)! / 2
        
        self.refreshControl?.tintColor = UIColor.clear
        self.refreshControl?.addSubview(self.loadingImg)
        
        self.bgCircle = UIView()
        self.bgCircle.backgroundColor = UIColor.yellow
        self.bgCircle.center.x = (self.refreshControl?.frame.width)! / 2
        self.refreshControl?.addSubview(self.bgCircle)
        self.refreshControl?.bringSubview(toFront: self.loadingImg)
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 스크롤 이벤트 발생할 때 마다 처리할 내용..
        // 주어진 인자값 중 큰 값을 반환하는 함수 max
        let distance = max(0.0, -(self.refreshControl?.frame.origin.y)!)
        // center.y 좌표를 당긴 거리 만큼 수정
        self.loadingImg.center.y = distance / 2
        
        // 당긴 거리를 회전 각도로 반환, 로딩 이미지에 설정하기
        let ts = CGAffineTransform(rotationAngle: CGFloat(distance / 20))
        self.loadingImg.transform = ts
        
        // 배경 뷰의 중심 좌표 설정
        self.bgCircle.center.y = distance / 2
    }
    
    // 스크롤 뷰 드래그 끝났을 경우
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.bgCircle.frame.size.width = 0
        self.bgCircle.frame.size.height = 0
    }
    
    @objc func pullToRefresh(_ sender: Any) {
        self.empList = self.empDAO.find()
        self.tableView.reloadData()
        
        self.refreshControl?.endRefreshing()
        
        // 노란 원이 로딩 이미지 중심으로 커지는 애니메이션
        let distance = max(0.0, -(self.refreshControl?.frame.origin.y)!)
        UIView.animate(withDuration: 0.5) {
            self.bgCircle.frame.size.width = 80
            self.bgCircle.frame.size.height = 80
            self.bgCircle.center.x = (self.refreshControl?.frame.width)! / 2
            self.bgCircle.center.y = distance / 2
            self.bgCircle.layer.cornerRadius = (self.bgCircle?.frame.size.width)! / 2
        }
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
    
    @IBAction func editing(_ sender: Any) {
        if self.isEditing == false {
            // 현재 편집 모드가 아닐 경우
            self.setEditing(true, animated: true)
            (sender as? UIBarButtonItem)?.title = "Done"
        } else {
            self.setEditing(false, animated: true)
            (sender as? UIBarButtonItem)?.title = "Edit"
        }
    }
    
    // 목록 편집 형식을 결정하는 메소드(삽입 / 삭제)
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    // 목록 편집 버튼을 클릭했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 삭제할 행의 empCd 추출
        let empCd = self.empList[indexPath.row].empCd
        // DB, DataSource, tableview에서 차례대로 삭제
        if empDAO.remove(empCd: empCd) {
            self.empList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // navTitle 갱신
            let navTitle = self.navigationItem.titleView as! UILabel
            navTitle.text = "사원 목록 \n" + "총 \(self.empList.count) 명"
        }
    }
    
    
}
