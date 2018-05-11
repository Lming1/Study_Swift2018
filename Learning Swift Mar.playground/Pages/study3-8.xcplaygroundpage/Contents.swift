import Foundation

// Type Property

struct Foo {
    // 타입 저장 프로퍼티
    static var sFoo = "구조체 타입 프로퍼티 값"
    
    // 타입 연산 프로퍼티
    static var cFoo: Int {
        return 1
    }
}

class Boo {
    static var sFoo = "클래스 타입 프로퍼티 값"
    
    static var cFoo: Int {
        return 10
    }
    
    class var oFoo: Int {
        return 100
    }
}

print(Foo.sFoo)
Foo.sFoo = "새로운 값"

print(Foo.sFoo)
print(Boo.sFoo)
print(Boo.cFoo)


// method = Instance Method / Type Method 로 구분


