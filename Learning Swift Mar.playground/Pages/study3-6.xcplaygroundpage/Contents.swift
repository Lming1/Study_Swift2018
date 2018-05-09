import Foundation

struct Position {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Rect {
    var origin = Position()
    var size = Size()
    
//    var center: Position {
//        get {
//        let centerX = self.origin.x + (self.size.width / 2)
//        let centerY = self.origin.y + (self.size.height / 2)
//        return Position(x: centerX, y: centerY)
//        }
//        set(newCenter) {
//            self.origin.x = newCenter.x - (size.width / 2)
//            self.origin.y = newCenter.y - (size.height / 2)
//        }
//    }
    
    func getCenter() -> Position {
        let centerX = self.origin.x + (self.size.width / 2)
        let centerY = self.origin.y + (self.size.height / 2)
        return Position(x: centerX, y: centerY)
    }
    mutating func setCenter(newCenter : Position) {
        self.origin.x = newCenter.x - (size.width / 2)
        self.origin.y = newCenter.y - (size.height / 2)
    }
}

let p = Position(x: 0.0, y: 0.0)
let s = Size(width: 10.0, height: 10.0)

var square = Rect(origin: p, size: s)
print("square.centerX = \(square.getCenter().x), square.centerY = \(square.getCenter().y) ")
//square.center = Position(x: 20.0, y: 20.0)
print("square.x = \(square.origin.x) , square.y = \(square.origin.y)")


//set을 제거하면 get-only(Read only)


