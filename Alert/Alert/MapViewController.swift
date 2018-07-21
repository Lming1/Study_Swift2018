//
//  MapViewController.swift
//  Alert
//
//  Created by 이민혁 on 2018. 7. 20..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let alertBtn = UIButton(type: .system)
        
        alertBtn.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alertBtn.center.x = self.view.frame.width / 2
        alertBtn.setTitle("Map Alert", for: .normal)
        alertBtn.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(alertBtn)
        
        let imageBtn = UIButton(type: .system)
        
        imageBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageBtn.center.x = self.view.frame.width / 2
        imageBtn.setTitle("Image Alert", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(imageBtn)
        
        let sliderBtn = UIButton(type: .system)
        
        sliderBtn.frame = CGRect(x: 0, y: 250, width: 100, height: 30)
        sliderBtn.center.x = self.view.frame.width / 2
        sliderBtn.setTitle("Slider Alert", for: .normal)
        sliderBtn.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(sliderBtn)
        
        let listBtn = UIButton(type: .system)
        
        listBtn.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        listBtn.center.x = self.view.frame.width / 2
        listBtn.setTitle("List Alert", for: .normal)
        listBtn.addTarget(self, action: #selector(listAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(listBtn)
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        print(">> 선택된 행은 \(indexPath.row)입니다.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func imageAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "평점", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        
        let contentVC = ImageViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        self.present(alert, animated: false)
    }
    
    
    @objc func mapAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "여기가 맞아요?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        // Map view
        let contentVC = MapKitViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        self.present(alert, animated: false)
    }
    
    @objc func sliderAlert(_ sender: Any) {
        let contentVC = ControlViewController()
        
        let alert = UIAlertController(title: nil, message: "평점 입력", preferredStyle: .alert)
        alert.setValue(contentVC, forKey: "contentViewController")
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print(">> sliderValue = \(contentVC.sliderValue)")
        }
        alert.addAction(okAction)
        
        self.present(alert, animated: false)
    }
    
    @objc func listAlert(_ sender: Any) {
        let contentVC = ListViewController()
        contentVC.delegate = self
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.setValue(contentVC, forKey: "contentViewController")
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: false)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
