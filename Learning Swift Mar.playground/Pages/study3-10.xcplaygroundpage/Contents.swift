import Foundation

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다."
    }
    
    func makeNoise(){
        
    }
}

let baseVehicle = Vehicle()
baseVehicle.description


class Bicycle: Vehicle {
    var hasBasket = false
    
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 20.0
print("자전거 : \(bicycle.description)")

class Tandem: Bicycle {
    var passengers = 0

}

let tandem = Tandem()

tandem.hasBasket = true
tandem.passengers = 2
tandem.currentSpeed = 15.0

print("Tandem : \(tandem.description)")



class Car: Vehicle {
    var gear = 0
    var engineLevel = 0
    
    override var currentSpeed: Double {
        get {
            return Double(self.engineLevel * 50)
        }
        set {
            
        }
    }
    
    override var description: String {
        get {
            return "Car : engineLevel=\(self.engineLevel), so currentSpeed=\(self.currentSpeed)"
        }
        set {
            print("New Value is \(newValue)")
        }
    }
}

let c = Car()
c.engineLevel = 5
c.currentSpeed
c.description = "New Class Car"

print(c.description)





