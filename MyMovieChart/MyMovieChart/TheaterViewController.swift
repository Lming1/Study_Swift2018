//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by 이민혁 on 2018. 6. 7..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit
import MapKit


class TheaterViewController: UIViewController {
    var param: NSDictionary!
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        // 1. 위도, 경도 추출 Double 캐스팅
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        // 2. 위도, 경도를 인수로 하는 2D위치 정보 객체 정의
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        // 3. 지도에 표현될 거리 : 값 단위 m
        let regionRadius: CLLocationDistance = 100
        // 4. 거리를 반영한 지역 정보를 조합한 지도 데이터 생성
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location, regionRadius, regionRadius)
        // 5. map 변수에 연결된 지도 객체에 데이터를 전달하여 화면에 표시
        self.map.setRegion(coordinateRegion, animated: true)
        
        // 위치를 표시해줄 객체를 생성, 앞에서 작성해준 위치 값 객체를 할당
        let point = MKPointAnnotation()
        point.coordinate = location
        // 위치 표현 값 추가
        self.map.addAnnotation(point)
    }
}
