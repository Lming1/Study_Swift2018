// function

// 매개변수와 반환값이 모두 없는 함수
func printHello(){
    print("hello")
}
// 매개변수가 없지만 반환값은 있는 함수
func sayHello() -> String {
    let retunValue = "hello"
    return retunValue
}
// 매개변수는 있으나 반환값이 없는 함수
func printHelloWithName(name: String){
    print("\(name)님, 안녕하세요")
}
// 매게변수와 반환값이 모두 있는 함수
func sayHelloWithName(name: String) -> String {
    let retunValue = "\(name)님, 안녕하세요"
    return retunValue
}

func hello(name: String?){
    guard let _name = name else {
        return
    }
    print("\(_name)님, 안녕하세요?")
}
let inputName = "홍길동"
printHello()
sayHello()
printHelloWithName(name: "james")
sayHelloWithName(name: "terry")
printHelloWithName(name: inputName)

func incrementBy(amount: Int, numberOfTimes: Int) {
    var count = 0
    count = amount * numberOfTimes
}
incrementBy(amount: 5, numberOfTimes: 2)

func times(x: Int, y: Int) -> Int {
    return (x * y)
}

times(x: 5, y: 10)
times(x:y:)(5,20)


// 튜플?

func getIndvInfo() -> (Int, String) {
    let height = 185
    let name = "밍"
    return (height, name)
}


func getUserInfo() -> (Int, Character, String){
    let gender: Character = "M"
    let height = 185
    let name = "밍"
    
    return (height, gender, name)
}

var uInfo = getUserInfo()
uInfo.0
uInfo.1
uInfo.2

var (a, b, c) = getUserInfo()
a
b
c

var (height, _, name) = getUserInfo()

height
name

func getUserInfo1() -> (h: Int, g: Character, n: String){
    let gender: Character = "M"
    let height = 185
    let name = "밍"
    return (height, gender, name)
}

var result = getUserInfo1()
result.g
result.h
result.n

// type alias 사용

typealias infoResult = (Int, Character, String)

func getUserInfo2() -> infoResult {
    let gender: Character = "M"
    let height = 185
    let name = "밍밍"
    return (height, gender, name)
}

let info = getUserInfo2()
info.0
info.1
info.2

typealias infoResult1 = (h: Int, g: Character, n: String)










