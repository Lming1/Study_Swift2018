//
//  PickerController.swift
//  HR
//
//  Created by 이민혁 on 2018. 9. 8..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import Foundation
import UIKit

class DepartPickerVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let departDAO = DepartmentDAO()
    var departList: [(departCd: Int, departTitle: String, departAddr: String)]! // picker view data source
    var pickerView: UIPickerView! // 피커 뷰 객체
    
    // 현재 피커 뷰에 선택되어 있는 부서 코드 가져오기.
    var selectedDepartCd: Int {
        let row = self.pickerView.selectedRow(inComponent: 0)
        return self.departList[row].departCd
    }
    
    override func viewDidLoad() {
        // DB에서 부서 목록을 가져오기.
        self.departList = self.departDAO.find()
        // picker view 객체 초기화, 최상위 뷰의 서브 뷰로 추가
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.view.addSubview(self.pickerView)
        // 외부에서 뷰 컨트롤러를 참조할 때를 위한 사이즈 지정
        let pWidth = self.pickerView.frame.width
        let pHeight = self.pickerView.frame.height
        self.preferredContentSize = CGSize(width: pWidth, height: pHeight)
    }
    
    // 피커 뷰에 표시될 전체 컴포넌트 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 컴포넌트 행 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.departList.count
    }
    
    // 피커 뷰의 각 행에 표시될 뷰를 결정하는 메소드
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var titleView = view as? UILabel
        if titleView == nil {
            titleView = UILabel()
            titleView?.font = UIFont.systemFont(ofSize: 14)
            titleView?.textAlignment = .center
        }
        titleView?.text = "\(self.departList[row].departTitle)(\(self.departList[row].departAddr))"
        return titleView!
    }
}
