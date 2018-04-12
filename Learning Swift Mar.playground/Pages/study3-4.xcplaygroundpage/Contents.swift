// 지연 저장 프로퍼티

class OnCreate {
    init() {
        print("On Create!!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = OnCreate()
    
    init() {
        print("Lazy Test")
    }
    
}

let lz = LazyTest()
lz.late

// 클로저를 이용한 저장 프로퍼티 초기화

class PropertyInit {
    // 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행.
    var value01: String! = {
        print("value execute")
        return "value01"
    }()
    
    let value02: String! = {
        print("value02 execute")
        return "value02"
    }()
    
    // 프로퍼티 참조 시에 최초 한 번만 실행
    lazy var value03: String! = {
        print("value03 execute")
        return "value03"
    }()
}


let s = PropertyInit()
s.value01
s.value02

let s1 = PropertyInit()
s1.value03
s1.value03




