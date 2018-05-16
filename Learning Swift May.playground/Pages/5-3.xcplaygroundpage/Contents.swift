import Foundation


// 부모 클래스에 기본 초기화 구문 외에 다른 형식의 초기화 구문이 있다면, 자식 클래스에서 override init 할 때, 부모 클래스의 기본 초기화 구문을 호출해야한다.
class Base {
    var baseValue: Double
    
    init() {
        self.baseValue = 0.0
        print("Base Init")
    }
    
    init(baseValue: Double) {
        self.baseValue = baseValue
    }
}

class ExBase: Base {
    override init() {
        super.init()
        print("ExBase Init")
    }
}

let ex = ExBase()



