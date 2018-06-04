//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 이민혁 on 2018. 5. 31..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    //튜플 아이템을 가진 배열로 정의된 데이터 셋
    var dataset = [
        ("다크 나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19)
    ]
    
    //테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        for (title, desc, opendate, rating) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
    override func viewDidLoad() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        // 데이터 소스에 저장된 값을 각 아울렛 변수에 할당하기
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
//        let title = cell.viewWithTag(101) as? UILabel
//        let desc = cell.viewWithTag(102) as? UILabel
//        let opendate = cell.viewWithTag(103) as? UILabel
//        let rating = cell.viewWithTag(104) as? UILabel
        
//        title?.text = row.title
//        desc?.text = row.description
//        opendate?.text = row.opendate
//        rating?.text = "\(row.rating!)"
        return cell
        
//        cell.textLabel?.text = row.title
        
        // 서브 타이틀에 데이터 연결
//        cell.detailTextLabel?.text = row.description
//        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
    }
}
