//
//  ListVC.swift
//  Study_CoreData
//
//  Created by 이민혁 on 2018. 9. 11..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ListVC: UITableViewController {
    
    lazy var list: [NSManagedObject] = {
        return self.fetch()
    }()
    
    // 데이터 읽어올 메소드..
    func fetch() -> [NSManagedObject] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Board")
        let result = try! context.fetch(fetchRequest)
        return result
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = self.list[indexPath.row]
        let title = record.value(forKey: "title") as? String
        let contents = record.value(forKey: "contents") as? String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = contents
        
        return cell
    }
    
}
