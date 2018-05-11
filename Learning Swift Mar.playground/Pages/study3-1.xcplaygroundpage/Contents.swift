
//// 함수 중첩
//
//
//func outer(base: Int) -> String {
//    func inner(inc: Int) -> String {
//        return "\(inc)를 반환합니다."
//    }
//    let result = inner(inc: base + 1)
//    return result
//}
//
//outer(base: 3)
//


func outer(param: Int) -> (Int) -> String {
    func inner(inc: Int) -> String {
        return "\(inc)를 리턴합니다."
    }
    return inner
}

let fn1 = outer(param: 3)
let fn2 = fn1(30)

func basic(param: Int) -> (Int) -> Int {
    let value = param + 20
    
    func append(add: Int) -> Int {
        return value + add
    }
    
    return append
}

//let result = basic(param: 20)
let result = basic(param: 20)
//let result = basic(test: 20)
result(30)


//클로저. --> 일회용 함수를 작성할 수 있는 구문.
// 전역함수 : 이름이 있으며, 주변 환경에서 캡처할 어떠한 값도 없는 클로저
// 중첩함수 : 이름이 있으며 자신을 둘러싼 함수로부터 값을 캡처할 수 있는 클로저
// 클로저 표현식 이름이 없으며 주변 환경으로부터 값을 캡처할 수 있는 경량 문법으로 작성된 클로저.
//
//{ (매개변수) -> 반환타입 in
//    print("클로저 실행")
//}

// 상수나 변수에 할당

let f = { () -> Void in
    print("클로저가 실행됩니다.")
}
f()


// 클로저를 직접 실행
({ () -> Void in
    print("클로저 실행 2번째")
})()

// 매개변수가 있는 클로저

//let c = {(s1: Int, s2: String) -> Void in
//    print("s1:\(s1), s2:\(s2)")
//}
//
//c(1, "closer")

// 직접 실행
({(c1: Int, c2: String) -> Void in
    print("c1:\(c1), c2:\(c2)")
})(1, "closer")


var value = [1, 9, 5, 7, 3, 2]


func order(i: Int, x: Int) -> Bool {
    if i > x {
        return true
    } else {
        return false
    }
}

value.sort(by: order(i:x:))


value.sort(by: {
    (i1: Int, i2: Int) -> Bool in
    if i1 > i2 {
        return true
    }else {
        return false
    }
})

var value1 = [3, 5, 20, 1, 39, 77, 66]
// 생략
value1.sort(by: {(i3: Int, i4:Int) -> Bool in return i3 > i4})

// 생략2
value.sort(by: {(i5: Int, i6:Int) in return i5 > i6})

// 타입 추론 활용.. 생략3
value.sort(by: {i, x in return i > x})

// 마지막 생략
value.sort(by: {$0 > $1})

// 연산자 함수 사용
value.sort(by: >)

// trailing closure

value.sort{ (s1, s2) in
    return s1 > s2
}


func divide(base: Int, success s: () -> Void, fail f: () -> Void) -> Int {
    guard base != 0 else {
        f()
        return 0
    }
    defer {
        s()
    }
    return 100 / base
}

//divide(base: 100){ () in
//    print("연산 성공")
//}

divide(base: 100, success: {() in
    print("연산 성공")
}){() in
    print("연산 실패")
}

// @escaping

func callback(fn: @escaping () -> Void) {
    let f = fn
    f()
}

callback {
    print("콜백 실행?")
}

//@autoclosure
func condition(stmt: @autoclosure () -> Bool) {
    if stmt() == true {
        print("결과는 참이다")
    } else {
        print("결과는 거짓이다.")
    }
}

//condition(stmt: {4 > 2})
//condition{4 > 2}
condition(stmt: (4 > 2))

var arrs = [String]()

func addVars(fn: @autoclosure () -> Void){
    arrs = Array(repeating: "", count: 3)
    fn()
}

addVars(fn: arrs.insert("KR", at: 1))





