// 일급 함수
// 객체가 런타임에도 생성이 가능해야함
// 인자값으로 객체를 전달할 수 있어야 함.
// 반환값으로 객체를 사용할 수 있어야 함.
// 변수나 데이터 구조 안에 저장할 수 있어야 함.
// 할당에 사용된 이름과 관계없이 고유한 구별이 가능해야함.

func foo(base: Int) -> String {
    print("함수 foo가 실행됩니다.")
    return "결과 값은 \(base + 1)입니다."
}

let fn1 = foo(base: 1)


let fn2 = foo
fn2(10)

let fn3 = foo(base: 5)

let fn4 = foo
fn4(15)

func boo(age: Int, name: String) -> String{
    return "\(name)의 나이는 \(age)세 입니다."
}

let s: (Int, String) -> String = boo(age:name:)


// 함수의 반환 타입으로 함수를 사용할 수 있음

func desc() -> String {
    return "this is desc()"
}

func pass() -> () -> String {
    return desc
}

let p = pass()
p()
