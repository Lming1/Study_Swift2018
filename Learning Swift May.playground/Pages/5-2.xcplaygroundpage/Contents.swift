import Foundation

// init 초기화 메소드

// init(<매개변수> : <타입>, <매개변수> : <타입> , ...) {
// 1. 매개변수의 초기화
// 2. 인스턴스 생성시 기타 처리할 내용
// }


struct Resolution {
    var width = 0
    var height = 0
    
    init(width: Int) {
        self.width = width
    }
    
}

class VideoMode {
    var resolution = Resolution(width: 2048)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    init() {
        
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(interlaced: Bool) {
        self.interlaced = interlaced
    }
    
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    
    init(interlaced: Bool, frameRate: Double, name: String) {
        self.interlaced = interlaced
        self.frameRate = frameRate
        self.name = name
    }
    
}

//let resolution = Resolution.init(width: 4096)
//let resolution = Resolution(width: 4096)
//let videoMode = VideoMode.init(interlaced: true, frameRate: 40.0)
//let videoMode = VideoMode(interlaced: true, frameRate: 40.0)


let nameVideoMode = VideoMode(name: "홍길동")
let simpleVideoMode = VideoMode(interlaced: true)
let doubleVideoMode = VideoMode(interlaced: true, frameRate: 40.0)
let tripleVideoMode = VideoMode(interlaced: true, frameRate: 40.0, name: "홍길동")

