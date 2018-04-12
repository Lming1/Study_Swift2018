class User {
    // 저장 프로퍼티 초기화
    // 첫번째 방법
//    var name: String
//
//    init() {
//        self.name = ""
//    }
    
    // 두번째 방법
//    var name: String?
//    var name: String!
    
    // 세번째 방법
    var name: String = ""
}

// 고정 길이 범위 구조체

struct FixedLengthRange {
    var startValue: Int
    let length: Int
}

// 가변 길이 범위 구조체
struct FlexibleLengthRange {
    let startVAlue: Int
    var length: Int
}

var rangeOfFiexedIntergers = FixedLengthRange(startValue: 0, length: 3)

rangeOfFiexedIntergers.startValue = 4

var rangeOfFlexibleIntegers = FlexibleLengthRange(startVAlue: 0, length: 3)
rangeOfFlexibleIntegers.length = 5

