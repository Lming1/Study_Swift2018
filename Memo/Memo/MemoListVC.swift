//
//  MemoListVC.swift
//  Memo
//
//  Created by 이민혁 on 2018. 6. 8..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    
    lazy var dao = MemoDAO()
    // AppDelegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        // search bar 키보드에서 리턴키 항상 활성화
        searchBar.enablesReturnKeyAutomatically = false
        
        if let revealVC = self.revealViewController() {
            let btn = UIBarButtonItem()
            btn.image = UIImage(named: "sidemenu.png")
            btn.target = revealVC
            btn.action = #selector(revealVC.revealToggle(_:))
            self.navigationItem.leftBarButtonItem = btn
            
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }
    
    // table view cell number
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memolist.count
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. memolist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼냄
        let row = self.appDelegate.memolist[indexPath.row]
        
        // 2. 이미지 속성이 비어 있을 경우 "memoCell", 그렇지 않으면 "memoCellWithImage"
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        // 3. dequeReusableCell로부터 prototype cell instance 전달 받기
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? MemoCell
        
        // 4. memocell 내용 구성
        cell?.subject?.text = row.title
        cell?.contents?.text = row.contents
        cell?.img?.image = row.image
        
        // 5. Date Type = "yyyy-MM-dd HH:mm:ss"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell?.regdate?.text = formatter.string(from: row.regdate!)
        
        // 6. cell 객체 리턴
        
        return cell!
    }
    
    // 디바이스 스크린에 view controller가 나타날 때마다 호출되는 method
    override func viewWillAppear(_ animated: Bool) {
        let ud = UserDefaults.standard
        if ud.bool(forKey: UserInfoKey.tutorial) == false {
            let vc = self.instanceTutorialVC(name: "MasterVC")
            self.present(vc!, animated: false)
            return
        }
        self.appDelegate.memolist = self.dao.fetch()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let data = self.appDelegate.memolist[indexPath.row]
        
        // CoreData에서 삭제한 다음, 배열 내 데이터 및 테이블 뷰 행을 차례대로 삭제
        if dao.delete(data.objectID!) {
            self.appDelegate.memolist.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        // 1. memolist 배열에서 선택된 행에 맞는 데이터를 꺼냄
//        let row = self.appDelegate.memolist[indexPath.row]
//        // 2. 상세 화면의 인스턴스 생성
//        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
//            return
//        }
//        // 3. 값을 전달하고 상세 화면으로 이동
//        vc.param = row
//        self.navigationController?.pushViewController(vc, animated: true)
//    }

 

}

// MARK: - 화면 전환 시 값을 넘겨주기 위한 세그웨이 처리
extension MemoListVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        NSLog("클릭")
        if (segue.identifier == "read_segue") {
            NSLog("세그웨이 실행됨")
            let cell = sender as! MemoCell
            let path = self.tableView.indexPath(for: cell)
            let row = self.appDelegate.memolist[path!.row]
            let readVC = segue.destination as? MemoReadVC
            readVC?.param = row
        }
    }
    
    
    // Search bar
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keyword = searchBar.text
        
        self.appDelegate.memolist = self.dao.fetch(keyword: keyword)
        self.tableView.reloadData()
    }
}

