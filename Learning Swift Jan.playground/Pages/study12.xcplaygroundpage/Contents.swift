func plus(a: Int, b: Int) -> Int {
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}

func times(a: Int, b: Int) -> Int {
    return a * b
}


func divide(a: Int, b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    return a / b
}

func calc(_ operand: String) -> (Int, Int) -> Int {
//    print("덧셈은 +, 뺄셈은 - 곱셈은 * 나눗셈은 /를 입력해주세요.")
    switch operand {
    case "+":
        return plus
    case "-":
        return minus
    case "*":
        return times
    case "/":
        return divide
    default:
        return plus
    }
}


