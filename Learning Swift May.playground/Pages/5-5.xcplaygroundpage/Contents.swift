import Foundation

//extension

extension Double {
    var km: Double { return self * 1_000.0}
    var m: Double { return self}
    var cm: Double {return self / 100.0}
    var mm: Double {return self / 1_000.0}
    var description : String {
        return "\(self)km는 \(self.km)m, \(self)cm는 \(self.cm)m, \(self)mm는 \(self.mm)입니다."
    }
}

2.km
5.5.cm
125.mm
7.0.description

let distance = 42.0.km + 195.m
print("마라톤의 총 거리는 \(distance)m입니다.")


extension Int {
    func repeatRun(task: () -> Void) {
        for _ in 0 ..< self {
            task()
        }
    }
    
    mutating func square() {
        self = self * self
    }
}

let d = 3
d.repeatRun(task: {print("반가워")})
d.repeatRun {
    print("반갑습니다.")
}

var value = 3
value.square()



