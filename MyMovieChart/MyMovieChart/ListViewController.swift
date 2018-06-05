//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 이민혁 on 2018. 5. 31..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit
import Foundation

class ListViewController: UITableViewController {
    var page = 1
    @IBOutlet var moreBtn: UIButton!
//    //튜플 아이템을 가진 배열로 정의된 데이터 셋
//    var dataset = [
//        ("다크 나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "darknight.jpg"),
//        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpg"),
//        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpg")
//    ]
    
    
    //테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
//        for (title, desc, opendate, rating, thumbnail) in self.dataset {
//            let mvo = MovieVO()
//            mvo.title = title
//            mvo.description = desc
//            mvo.opendate = opendate
//            mvo.rating = rating
//            mvo.thumbnail = thumbnail
//
//            datalist.append(mvo)
//        }
        return datalist
    }()
    
    override func viewDidLoad() {
        self.callMovieAPI()
    }
    
    func callMovieAPI() {
        // get uri
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        // rest api call
        let apidata = try! Data(contentsOf: apiURI)
        // log
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "Data 없어요.."
        NSLog("API Result = \(log)")
        
        // JSON 객체 파싱 NSDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            // 데이터 구조에 따라 차례대로 캐스팅
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // Iterator 처리, API 데이터를 MovieVO객체 저장
            for row in movie {
                // 순회 상수를 딕셔너리 타입으로 캐스팅
                let r = row as! NSDictionary
                // 테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                
                // 무비 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                // 웹상에 있는 이미지를 읽어와 UIImage 객체로 생성하기.
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
                // list 배열에 추가
                self.list.append(mvo)
            }
            // 전체 데이터 카운트를 얻는다.
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            // totalCount가 읽어온 데이터 크기와 같거나 클 경우 더보기 버튼을 막는다.
            if (self.list.count >= totalCount) {
                self.moreBtn.isHidden = true
            }
        } catch{
            NSLog("Parse Error!!")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        NSLog("제목 : \(row.title!), 호출된 행번호 : \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        // 데이터 소스에 저장된 값을 각 아울렛 변수에 할당하기
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        // thumbnail local 처리
//        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        
        
        // 섬네일 경로를 인자값으로 하는 URL 객체 생성(메모이제이션 기법에 따라 제외)
//        let url: URL! = URL(string: row.thumbnail!)
        // 이미지를 읽어와 Data 객체 저장
//        let imageData = try! Data(contentsOf: url)
        // UIImage 객체를 생성하여 아울렛 변수의 Image 속성에 대입
//        cell.thumbnail.image = UIImage(data: imageData)
        
//        cell.thumbnail.image = UIImage(data: try! Data(contentsOf: URL(string: row.thumbnail!)!))
        
//        let title = cell.viewWithTag(101) as? UILabel
//        let desc = cell.viewWithTag(102) as? UILabel
//        let opendate = cell.viewWithTag(103) as? UILabel
//        let rating = cell.viewWithTag(104) as? UILabel
        
//        title?.text = row.title
//        desc?.text = row.description
//        opendate?.text = row.opendate
//        rating?.text = "\(row.rating!)"
        DispatchQueue.main.async(execute: {
            // 이미지 객체 대입
            // Asynchronize 처리
            NSLog("Asynchronize 실행")
            cell.thumbnail.image = self.getThumnailImage(indexPath.row)
        })
        NSLog("methon 실행 종료. return cell")
        
        return cell
        
//        cell.textLabel?.text = row.title
        
        // 서브 타이틀에 데이터 연결
//        cell.detailTextLabel?.text = row.description
//        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
    }
    
    
    @IBAction func more(_ sender: Any) {
        self.page += 1
        self.callMovieAPI()
        self.tableView.reloadData()
    }
    
    func getThumnailImage(_ index: Int) -> UIImage {
        // 인자 값으로 받은 인덱스를 기반으로 해당하는 배열 데이터를 읽어옴
        let mvo = self.list[index]
        // memoization : 저장된 이미지가 있으면 해당 이미지 반환, 없을 경우 내려받아 저장한 후 반환
        if let savadImage = mvo.thumbnailImage {
            return savadImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            return mvo.thumbnailImage!
        }
    }
}

// MARK: - 화면 전환 시 값을 넘겨주기 위한 세그웨이 처리
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 실행된 세그웨이의 식별자가 다음과 같다면. 사용자가 클릭한 행을 찾는다.
        if segue.identifier == "segue_detail" {
            // sender 인자 캐스팅. 테이블 셀 객체 변환.
            let cell = sender as! MovieCell
            // 사용자가 클릭한 행을 찾기
            let path = self.tableView.indexPath(for: cell)
            // API 영화 데이터 배열 중에서 선택된 행에 대한 데이터 추출
            let movieinfo = self.list[path!.row]
            // 행 정보를 통해 선택된 영화데이터를 찾은 다음, 목적지 뷰 컨트롤러의 mvo 변수 대입
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = movieinfo
        }
    }
}
