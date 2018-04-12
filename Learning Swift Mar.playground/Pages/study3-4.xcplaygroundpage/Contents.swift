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
