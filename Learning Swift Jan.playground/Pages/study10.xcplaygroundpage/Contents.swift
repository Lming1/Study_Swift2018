// 변수의 생존 범위와 생명 주기(scope)


// local var
do {
    var ccnt = 0
    do {
        ccnt = 3
        print(ccnt)
    }
    ccnt += 1
    print(ccnt)
}

// global var

var count = 30

func foo(count: Int) -> Int {
    var count = count
    count += 1
    return count
}

print(foo(count: count))
print(count)

// 내부 -> 외부 -> 글로벌 -> import 라이브러리

