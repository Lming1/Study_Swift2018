import Foundation

class Man {
    var name: String?
    
    init(name: String = "홍길동") {
        self.name = name
    }
}


protocol Job {
    func doWork()
}

// extension에서는 저장 프로퍼티를 정의할 수 없음.
// 따라서, 연산 프로퍼티로 구현해주어야함.
extension Man: Job {
    func doWork() {
        print("\(self.name!)님이 일을 합니다")
    }
}


let man = Man(name: "개발자")
man.doWork()

protocol A {
    func doA()
}

protocol B {
    func doB()
}

protocol C: A, B {
    func doC()
}


class ABC: C {
    
    
    func doA() {
        
    }
    
    func doB() {
        
    }
    
    func doC() {
        
    }
}



let abc: C = ABC()
let a: A = ABC()
let ab: A & B = ABC()
let abc2: A & B & C = ABC()

func foo(abc: C) {}
foo(abc: ABC())

func boo(abc: A & B){}
boo(abc: ABC())


// as 연산자 제한된 범위
// 실제로 할당된 인스턴스 타입
// 인스턴스가 구현한 프로토콜 타입
// 클래스가 상속을 받았을 경우 모든 상위 클래스
// 프로토콜 타입이 상속을 받았을 경우 모든 상위 프로토콜
// 옵셔널 캐스팅 as? / 강제 캐스팅 as! 중 선택 사용..(상황에 맞게)


protocol Machine {
    func join()
}

protocol Wheel: Machine {
    func lotate()
    init(name: String, currentSpeed: Double)
}

class Vehicle {
    var currentSpeed = 0.0
    var name = ""
    init(name: String, currentSpeed: Double) {
        self.name = name
        self.currentSpeed = currentSpeed
    }
    
}

class Car: Vehicle, Wheel {
    
    required override init(name: String, currentSpeed: Double = 0.0) {
        super.init(name: name, currentSpeed: currentSpeed)
    }
    
    func join() {
        
    }
    
    func lotate() {
        print("\(self.name)의 바퀴가 회전합니다.")
    }
}

class Carpet: Vehicle, Machine {
    func join() {
        
    }
}


var translist = [Vehicle]()
translist.append(Car(name: "car", currentSpeed: 10.0))
translist.append(Carpet(name: "양탄자", currentSpeed: 15.0))

for trans in translist {
    if let obj = trans as? Wheel {
        obj.lotate()
    } else {
        print("\(trans.name)의 하위 타입 변환이 실패하였습니다.")
    }
}



