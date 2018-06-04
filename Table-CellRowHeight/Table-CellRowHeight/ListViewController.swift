//
//  ListViewController.swift
//  Table-CellRowHeight
//
//  Created by 이민혁 on 2018. 6. 5..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    var list = [String]()
    
    @IBAction func add(_ sender: Any) {
        // 알림창 객체 인스턴스 생성
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요", preferredStyle: .alert)
        // 알림창에 입력폼 추가
        alert.addTextField() { (tf) in
            tf.placeholder = "내용을 입력해주세요."
        }
        
        // OK 버튼 추가(아직 알림창 객체에 버튼이 등록되지 않은 상태
        // 알림창에 0번째 입력필드에 값이 있다면, 배열에 입력된 값을 추가하고 테이블 갱신
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            if let title = alert.textFields?[0].text {
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        // 취소 버튼 객체(아직 알림창 객체에 버튼이 등록되지 않은 상태
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // 알림창 객체에 버튼 객체를 등록
        alert.addAction(ok)
        alert.addAction(cancel)
        // 알림창을 띄운다
        self.present(alert, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "cell" id를 가진 cell을 읽어온다. 없으면 UITableViewCell 인스턴스 생성
        // ?? 옵셔널 타입 해제., 앞쪽에는 옵셔널 값. 뒤쪽에는 일반 값
        // 뒤쪽, 앞쪽(해제한 타입) 과 타입이 일치해야함.
        // A!= nil ? A! : B
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        // 셀의 기본 텍스트 레이블 행 수 제한을 없앤다?
        cell.textLabel?.numberOfLines = 0
        // 셀의 기본 텍스트 레이블에 배열 변수의 값을 할당한다.
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 임시 값(높이) 설정
        self.tableView.estimatedRowHeight = 50
        // 높이 값이 동적으로 설정될 것을 알려줘라.
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let row = self.list[indexPath.row]
//
//        // 높이 조절. 기본 높이 60.  글의 길이가 30자를 넘어갈 때마다 20만큼씩 늘려준다.
//        let height = CGFloat(60 + (row.count / 30) * 20)
//        return height
//    }
}
