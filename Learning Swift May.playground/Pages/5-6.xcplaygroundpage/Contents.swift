import Foundation

protocol SomePropertyProtocol {
    var name: String {get set}
    var description: String { get}
}


struct NewoneMember: SomePropertyProtocol {
    var name = "ming"
    var description: String {
        return "Name : \(self.name)"
    }
}

protocol SomeMethodProtocol {
    func execute(cmd: String)
    func showPort(p: Int) -> String
}

struct NewoneService: SomeMethodProtocol {
    func execute(cmd: String) {
        if cmd == "start" {
            print("실행")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p)"
    }
}

protocol NewMethodProtocol {
    mutating func execute(cmd command: String, desc: String)
    func showPort(p: Int, memo desc: String) -> String
}

struct NewoneNewService: NewMethodProtocol {
    func execute(cmd command: String, desc: String) {
        if command == "start" {
            print("\(desc) 실행")
        }
    }
    
    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo: \(desc)"
    }
}


protocol NwService {
    mutating func execute(cmd: String)
    func showPort(p: Int) -> String
}


struct NewoneNwService: NwService {
    var paramCommand: String?
    mutating func execute(cmd: String) {
        self.paramCommand = cmd
        if cmd == "start" {
            print("실행")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}
// class는 참조 타입의 객체임에 따라, 메소드 내부에서 프로퍼티를 수정하더라도 mutating 키워드를 붙일 필요 x.
class NewoneThread: NwService {
    var paramCommand: String?
    
    func execute(cmd: String) {
        self.paramCommand = cmd
        if cmd == "start" {
            print("실행")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}


// Type Method..

protocol SomeTypeProtocol {
    static var defaultValue: String {get set}
    static func getDefaultValue() -> String
}


struct TypeStruct: SomeTypeProtocol {
    static var defaultValue = "default"
    
    static func getDefaultValue() -> String {
        return defaultValue
    }
}

class ValueObject: SomeTypeProtocol {
    static var defaultValue = "default"
    class func getDefaultValue() -> String {
        return defaultValue
    }
}


// Protocol Init
// 구현되는 Init method 이름과 매개변수명은 Protocol의 명세에 작성된 것과 일치해야함
// Protocol 명세에 선언된 Init method는 기본 제공되는 Init method일지라도 직접 구현해야함
// Class에서 'Init method'를 구현할 때 required 키워드를 붙여야함
protocol SomeInitProtocol {
    init()
    init(cmd: String)
}

struct SInit: SomeInitProtocol {
    var cmd: String
    init() {
        self.cmd = "start"
    }
    init(cmd: String) {
        self.cmd = cmd
    }
}

class CInit: SomeInitProtocol {
    var cmd: String
    required init() {
        self.cmd = "start"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
}


protocol Init {
    init()
    func getValue()
}


class Parent {
    init() {
        
    }
    
    func getValue() {
        
    }
}

//부모 클래스가 있다면 무조건 부모 클래스부터.

// 상속과 프로토콜 구현이 동시에.. 일어날 경우
class Child: Parent, Init {
    override required init() {
        
    }
    
    override func getValue() {
        
    }
}


struct MultiImplement: NewMethodProtocol, SomeInitProtocol {
    var cmd: String

    init() {
        self.cmd = "default"
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
    
    mutating func execute(cmd: String, desc: String) {
        self.cmd = cmd
        if cmd == "start" {
            print("시작")
        }
    }
    
    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo : \(desc)"
    }
}


// 상수, 변수 그리고 프로퍼티 타입으로 사용할 수 있음
// 함수, 메소드 또는 초기화 구문에서 매개변수 타입이나 반환 타입으로 사용할 수 있음.
// 배열, 딕셔너리 혹은 다른 컨테이너 타입으로 사용할 수 있음.

protocol Wheel {
    func spin()
    func hold()
}


class Bicycle: Wheel {
    
    var moveState = false
    
    func spin() {
        self.pedal()
    }
    
    func hold() {
        self.pullBreak()
    }
    
    func pedal() {
        self.moveState = true
    }
    
    func pullBreak() {
        self.moveState = false
    }
    
}


let trans = Bicycle()

trans.moveState
trans.pedal()
trans.pullBreak()
trans.spin()
trans.hold()


let trans1: Wheel = Bicycle()

trans1.hold()
trans1.spin()


protocol A {
    func doA()
}

protocol B {
    func doB()
}


class Impl: A, B {
    func doA() {
        
    }
    
    func doB() {
        
    }
    
    func desc() -> String {
        return "Class instance method"
    }
    
}

var ipl: A & B = Impl()

ipl.doA()
ipl.doB()
