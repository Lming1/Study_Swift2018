//
//  ViewController.swift
//  Test_SQLite3
//
//  Created by 이민혁 on 2018. 8. 12..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        var db: OpaquePointer? = nil // SQLite connect data
        var stmt: OpaquePointer? = nil // compile sql
        // Search SQLite DB
        let fileMgr = FileManager()
        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path

        if fileMgr.fileExists(atPath: dbPath) == false {
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath)
        }
        
        
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            if sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK {
                if sqlite3_step(stmt) == SQLITE_DONE {
                    print("Create Table Success!")
                }
                sqlite3_finalize(stmt)
            } else {
                print("Prepare Statement Fail")
            }
            sqlite3_close(db)
        } else {
            print("Database Connect Fail")
            return
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

