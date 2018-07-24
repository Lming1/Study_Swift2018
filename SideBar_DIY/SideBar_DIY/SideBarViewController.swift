//
//  SideBarViewController.swift
//  SideBar_DIY
//
//  Created by 이민혁 on 2018. 7. 25..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class SideBarViewController: UITableViewController {
    let titles =  [
        "메뉴 1",
        "메뉴 2",
        "메뉴 3",
        "메뉴 4",
        "메뉴 5"
    ]
    
    let icons = [
        UIImage(named: "icon01.png"),
        UIImage(named: "icon02.png"),
        UIImage(named: "icon03.png"),
        UIImage(named: "icon04.png"),
        UIImage(named: "icon05.png")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // 사용자 계정정보 레이블
        let accountLabel = UILabel()
        accountLabel.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        accountLabel.text = "raphael.lee@likelion.org"
        accountLabel.textColor = UIColor.white
        
        // 테이블 뷰 상단에 표시될 뷰 정의
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        v.backgroundColor = UIColor.blue
        v.addSubview(accountLabel)
        
        // 생성한 뷰를 테이블 헤더 뷰 영영에 등록
        self.tableView.tableHeaderView = v
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용 큐로부터 테이블 셀을 꺼내오기
        let id = "menucell"
//        var cell = tableView.dequeueReusableCell(withIdentifier: id)
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        // 재사용 큐에 등록된 테이블 뷰 셀이 없다면 새로 추가
        
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: id)
//        }
        // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
        
        // 타이틀과 이미지 대입
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        // 폰트 설정
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }

}
