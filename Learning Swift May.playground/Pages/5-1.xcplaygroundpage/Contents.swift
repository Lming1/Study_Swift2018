import Foundation
// 타입 캐스팅


class Vehicle {
    var currentSpeed = 0.0

    func accelerate() {
        self.currentSpeed += 1
    }
}

class Car: Vehicle {
    var gear: Int {
        return Int(self.currentSpeed / 20) + 1
    }

    func wiper()  {

    }
}

class SUV: Car {
    var fourWheel = false
    func move(param: Vehicle) {
        param.accelerate()
    }
}

let trans: Vehicle = Car()
let jeep: Vehicle = SUV()

//var list = [Vehicle]()
//
//list.append(Vehicle())
//list.append(Car())
//list.append(SUV())

// 인스턴스(or 변수, 상수) is 비교대상 타입

//SUV() is SUV
//SUV() is Car
//SUV() is Vehicle
//
//Car() is Vehicle
//Car() is SUV



let myCar: Vehicle = SUV()

if myCar is SUV {
    print("myCar는 SUV 타입")
} else {
    print("myCar는 SUV 타입이 아니다.")
}


// 타입 캐스팅 연산
let someCar: Vehicle = SUV()


// Up casting : 객체 as 변환할 타입
// Down casting : 객체 as? 변환할 타입(결과는 옵셔널 타입) or 객체 as! 변환할 타입(결과는 일반 타입)

let anyCar: Car = SUV()
let anyVehicle = anyCar as Vehicle

let anySUV = anyCar as? SUV
if anySUV != nil {
    print("\(anySUV!)캐스팅 성공")
}

if let anySUV = anyCar as? SUV {
    print("\(anySUV)캐스팅 성공")
}

let anySUV1 = anyCar as! SUV
print("\(anySUV1)캐스팅 성공")


// Any, AnyObject

var allCar: AnyObject = Car()
allCar = SUV()


func move(_ param: AnyObject) -> AnyObject {
    return param
}

move(Car())
move(Vehicle())


var list = [AnyObject]()
list.append(Vehicle())
list.append(Car())
list.append(SUV())


let obj: AnyObject = SUV()

if let suv = obj as? SUV {
    print("\(suv) 캐스팅이 성공했습니다.")
}

var value: Any = "Sample String"
value = 3
value = false
value = [1, 3, 5, 7, 9]

value = {
    print("함수 실행")
}


func name(_ param: Any) {
    print("\(param)")
}

name(3)
name(false)
name([1, 3, 5, 7, 9])
name {
    print(">>>")
}

var rows = [Any]()
// Any 사용 주의할 것. 스위프트에서 사용되는 정적인 타입들을 모두 동적인 타입으로 바꾼다.
rows.append(3)
rows.append(false)
rows.append([1, 3, 5, 7, 9])
rows.append {
    print(">>>")
}




