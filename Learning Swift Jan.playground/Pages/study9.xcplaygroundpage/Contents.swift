func incrementBy(base: Int) ->Int{
    var base = base
    base += 1
    return base
}

incrementBy(base: 5)

func descAge(name: String, _ paramAge: Int) -> String {
    var name = name
    var paramAge = paramAge
    
    name = name + "씨"
    paramAge += 1
    return "\(name)의 내년 나이는 \(paramAge)세 입니다."
}

//descAge(name: "재윤", 5)
descAge(name: "밍", 10)



// InOut 매개변수
var cnt = 30
func autoIncrement(value: Int) -> Int {
    var value = value
    value += 1
    
    return value
}

print(autoIncrement(value: cnt))
print(cnt)

var count = 30
func foo(paramCount: inout Int) -> Int {
    paramCount += 1
    return paramCount
}

print(foo(paramCount: &count))
print(count)
