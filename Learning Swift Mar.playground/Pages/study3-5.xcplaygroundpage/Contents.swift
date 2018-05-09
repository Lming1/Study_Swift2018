import Foundation
// 나이 구하기
//var 프로퍼티명 : type {
//    get {
//        필요 연산 과정
//        return 반환값
//    }
//    set(매개변수명) {
//        필요 연산 구문
//    }
//}



struct UserInfo {
    var birth: Int!
    
    var thisYear: Int! {
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
    
    var age: Int {
        get {
            return (self.thisYear - self.birth) + 1
        }
    }
    
}
let info = UserInfo(birth: 1994)
print(info.age)


// 사각형 중심 좌표 계산

struct Rect {
    var originX: Double = 0.0, originY: Double = 0.0
    var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
    
    var centerX: Double {
        get {
            return self.originX + (sizeWidth / 2)
        }
        set(newCenterX) {
            originX = newCenterX - (sizeWidth / 2)
        }
    }
    
    var centerY: Double {
        get {
            return self.originY + (self.sizeHeight / 2)
        }
        set(newCenterY) {
            self.originY = newCenterY - (self.sizeHeight / 2)
        }
    }
}

var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
print("square.centerX = \(square.centerX), square.centerY = \(square.centerY)")

