//
//  ListViewController.swift
//  UserDefaults
//
//  Created by 이민혁 on 2018. 7. 26..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit
public enum GenderType : Int {
    case male = 0
    case female = 1
}
class ListViewController: UITableViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var married: UISwitch!
    
    @IBAction func edit(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
        alert.addTextField() {
            $0.text = self.name.text
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            let value = alert.textFields?[0].text
            let plist = UserDefaults.standard
            plist.setValue(value, forKey: "name")
            plist.synchronize()
            self.name.text = value
        })
        
        self.present(alert, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let plist = UserDefaults.standard
        self.name.text = plist.string(forKey: "name")
        self.married.isOn = plist.bool(forKey: "married")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: "gender")
        plist.synchronize()
    }
//    func getGenderValue(value: Int) -> GenderType? {
//        switch value {
//        case 0:
//            return .male
//        case 1:
//            return .female
//        default:
//            return nil
//        }
//    }
//
//    func getGenderCode(value: GenderType) -> Int {
//        return value.rawValue
//    }
//
    
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        let value = sender.isOn
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: "married")
        plist.synchronize()
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        if indexPath.row == 0 {
////            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
////            alert.addTextField() {
////                $0.text = self.name.text
////            }
////
////            alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
////                // OK버튼을 누르면 입력 필드에 입력된 값을 저장
////                let value = alert.textFields?[0].text
////
////                let plist = UserDefaults.standard
////                plist.setValue(value, forKey: "name")
////                plist.synchronize()
////
////                self.name.text = value
////            })
////
////            self.present(alert, animated: false, completion: nil)
////        }
//    }
    
    
    

}
