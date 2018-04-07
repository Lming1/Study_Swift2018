// 외부 매개변수 & 내부 매개변수

func printHello(name: String, msg: String){
    print("\(name)님, \(msg)")
}

printHello(name: "john", msg: "hello?")

func printHello1(to name: String, welcomeMessage msg: String){
    print("\(name)님, \(msg)")
}
printHello1(to: "paul", welcomeMessage: "good bye")

func printHello2(_ name: String, _ msg: String){
    print("\(name)님, \(msg)")
}

printHello2("hello", "hello")


// 가변 인자 부여

func avg(score: Int...) -> Double {
    var total = 0
    for r in score {
        total += r
    }
    return (Double(total) / Double(score.count))
}

print(avg(score: 10, 20, 30, 40))


// 기본 값을 갖는 매개변수

func echo(message: String, newline: Bool = true) {
    if newline == true {
        print(message, true)
    } else {
        print(message, false)
    }
}

echo(message: "hello")
//echo(message: "hello", newline: false)

//echo(message: "hello", newline: false)

