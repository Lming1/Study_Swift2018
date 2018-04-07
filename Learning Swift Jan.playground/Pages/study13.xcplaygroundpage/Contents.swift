// callback function

func incr(param: Int) -> Int {
    return param + 1
}

func broker(base: Int, function fn: (Int) -> Int) -> Int {
    return fn(base)
}


broker(base: 3, function: incr)


//callback function example

func successThrough(){
    print("연산 처리 성공")
}

func failThrough(){
    print("연산 처리 실패")
}

func divide(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
    guard base != 0 else {
        fCallBack()
        return 0
    }
//지연 블록
//함수가 종료되기 전에 실행
//defer 블록을 읽기 전에 함수 실행이 종료될경우 실행되지 않음
//
    defer {
        sCallBack()
    }
    return 100 / base
}

divide(base: 20, success: successThrough, fail: failThrough)
divide(base: 20, success: {() -> Void in print("연산 처리 성공했어요")}, fail: {() -> Void in print("연산 처리 실패했어요")})
