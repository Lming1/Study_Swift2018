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

var list = [Vehicle]()

list.append(Vehicle())
list.append(Car())
list.append(SUV())

// 인스턴스(or 변수, 상수) is 비교대상 타입

SUV() is SUV
SUV() is Car
SUV() is Vehicle

Car() is Vehicle
Car() is SUV



let myCar: Vehicle = SUV()

if myCar is SUV {
    print("myCar는 SUV 타입")
} else {
    print("myCar는 SUV 타입이 아니다.")
}


// 타입 캐스팅 연산
let someCar: Vehicle = SUV()

