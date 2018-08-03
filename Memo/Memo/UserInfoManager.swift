//
//  UserInfoManager.swift
//  Memo
//
//  Created by 이민혁 on 2018. 8. 3..
//  Copyright © 2018년 이민혁. All rights reserved.
//

import Foundation
import UIKit

struct UserInfoKey {
    static let loginId = "LOGINID"
    static let account = "ACCOUNT"
    static let name = "NAME"
    static let profile = "PROFILE"
}



class UserInfoManager {
    var loginid: Int {
        get {
            return UserDefaults.standard.integer(forKey: UserInfoKey.loginId)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.loginId)
            ud.synchronize()
        }
    }
    
    var account: String?  {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.account)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.account)
            ud.synchronize()
        }
    }
    
    var name: String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.name)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.name)
            ud.synchronize()
        }
    }
    
    var profile: UIImage? {
        get {
            let ud = UserDefaults.standard
            if let _profile = ud.data(forKey: UserInfoKey.profile) {
                return UIImage(data: _profile)
            } else {
                return UIImage(named: "account.jpg")
            }
        } set(v) {
            if v != nil {
                let ud = UserDefaults.standard
                // UIImagePNGRepresentation = UIImage 타입의 객체를 데이터 유실 없이 Data 타입으로 변환
                ud.set(UIImagePNGRepresentation(v!), forKey: UserInfoKey.profile)
                ud.synchronize()
            }
        }
    }
    
    // 로그인 상태
    var isLogin: Bool {
        if self.loginid == 0 || self.account == nil {
            return false
        } else {
            return true
        }
    }
    
    func login(account: String, passwd: String) -> Bool {
        // 향후 서버 연동 코드로 대체 예정
        if account.isEqual("raphael.lee@likelion.org") && passwd.isEqual("1234") {
            let ud = UserDefaults.standard
            ud.set(100, forKey: UserInfoKey.loginId)
            ud.set(account, forKey: UserInfoKey.account)
            ud.set("밍", forKey: UserInfoKey.name)
            ud.synchronize()
            return true
        } else {
            return false
        }
    }
    
    func logout() -> Bool {
        let ud = UserDefaults.standard
        ud.removeObject(forKey: UserInfoKey.loginId)
        ud.removeObject(forKey: UserInfoKey.account)
        ud.removeObject(forKey: UserInfoKey.name)
        ud.removeObject(forKey: UserInfoKey.profile)
        ud.synchronize()
        return true
    }
    
    
}
