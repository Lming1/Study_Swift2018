import Foundation


// 부모 클래스에 기본 초기화 구문 외에 다른 형식의 초기화 구문이 있다면, 자식 클래스에서 override init 할 때, 부모 클래스의 기본 초기화 구문을 호출해야한다.
class Base {
    var baseValue: Double
    
    init() {
        self.baseValue = 0.0
        print("Base Init")
    }
    
    init(baseValue: Double) {
        self.baseValue = baseValue
    }
}

class ExBase: Base {
    override init() {
        super.init()
        print("ExBase Init")
    }
}

let ex = ExBase()


// 옵셔널 체인
// 옵셔널 타입 : nil이 할당될 수 있는 값


struct Human {
    var name: String?
    var man: Bool = true
}

var boy: Human? = Human(name: "홍길동", man: true)

// 옵셔널 안정성 검사
if boy != nil {
    if boy!.name != nil {
        print("이름은 \(boy!.name!)입니다.")
    }
}
// 옵셔널 비강제 해제 구문
if let b = boy {
    if let name = b.name {
        print("이름은 \(name)입니다.")
    }
}


struct Company {
    var ceo: Human?
    var companyName: String?
    func getCEO() -> Human? {
        return self.ceo
    }
}

var startup: Company? = Company(ceo: Human(name: "대표", man: true), companyName: "Newone")

if let company = startup {
    if let ceo = company.ceo {
        if let name = ceo.name {
            print("대표 이사의 이름은 \(name)입니다.")
        }
    }
}


if let name = startup!.ceo!.name {
    print("대표 이사의 이름은 \(name)입니다.")
}


// 옵셔널 체인 = 객체가 nil인 상황에서 안전성 검사를 하지 않고 메소드나 프로퍼티를 호출하더라도 오류가 발생하지 않을 수 있는 문법을 옵셔널 스타일을 이용하여 구현한다..

startup?.ceo?.name

if let name = startup?.ceo?.name {
    print("대표 이사의 이름은 \(name)입니다.")
}

print(startup?.ceo?.man)


var someCompany: Company? = Company(ceo: Human(name: "lming", man: true), companyName: "newone")

let name = someCompany?.getCEO()?.name
if name != nil {
    print("대표이사의 이름은 \(name!)입니다.")
}


// 옵셔널 강제 해제 -> someCompany!.getCEO()!.name
// 객체가 nil일 경우 런타임 오류가 발생
