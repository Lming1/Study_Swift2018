// 함수 중첩


func outer(base: Int) -> String {
    func inner(inc: Int) -> String {
        return "\(inc)를 반환합니다."
    }
    let result = inner(inc: base + 1)
    return result
}

outer(base: 3)
