import Foundation

// Delegation

// 특정 기능을 다른 객체에 위임, 그에 따라 필요한 시점에서 메소드의 호출만 받는 패턴

protocol FuelPumpDelegate {
    func lackFuel()
    func fullFuel()
}


class FuelPump {
    var maxGage: Double = 100.0
    var delegate: FuelPumpDelegate? = nil
    
    var fuelGage: Double {
        didSet {
            if oldValue < 10 {
                // 연료가 부족할경우 델리게이트의 lackFule 호출
                self.delegate?.lackFuel()
            } else if oldValue == self.maxGage {
                // 연료가 가득차면 fullFuel 호출
                self.delegate?.fullFuel()
            }
        }
    }
    init(fuelGage: Double = 0) {
        self.fuelGage = fuelGage
    }
    
    func startPump() {
        while (true) {
            if (self.fuelGage > 0) {
                self.jetFuel()
            } else {
                break
            }
        }
    }
    
    func jetFuel() {
        self.fuelGage -= 1
    }
}

class Car: FuelPumpDelegate {
    var fuelPump = FuelPump(fuelGage: 100)
    init() {
        self.fuelPump.delegate = self
    }
    
    func lackFuel() {
        
    }
    
    func fullFuel() {
        
    }
    
    func start()  {
        fuelPump.startPump()
    }
}

let car = Car()
car.start()

