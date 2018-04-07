//var capital : Dictionary<String, String>?
var capital = ["KR" : "Seoul", "EN" : "London", "FR" : "Paris"]

if (capital["KR"] != nil) {
    print(capital["KR"]!)
}

if let val = capital["KR"] {
    print(val)
}

// 컴파일러에 의한 옵셔널 자동 해제
// 비교 연산자를 사용하는 경우 자동으로 해제한다.
let optInt = Int("123")

if ((optInt!) == 123) {
    print("optInt == 123")
} else {
    print("optInt != 123")
}

if (optInt == 123) {
    print("optInt == 123")
} else {
    print("optInt != 123")
}

let tempInt = Int("123")

tempInt == 123
tempInt == Optional(123)
tempInt! == 123
tempInt! == Optional(123)

// 옵셔널 값 할당

var optValue01 = Optional(123)
var optValue02 : Int? = 123

// 옵셔널 묵시적 해제

var str: String! = "Swift Optional"
print(str)

var value01: Int! = 10
value01 + 20


